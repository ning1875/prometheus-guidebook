## multi_remote_read 
> 如果我们配置了多个remote_read 接口的话即可实现 multi

```yaml
remote_read:
  - url: "http://172.20.70.205:9090/api/v1/read"
    read_recent: true
  - url: "http://172.20.70.215:9090/api/v1/read"
    read_recent: true

``` 

> 上述配置代表并发查询两个后端存储，并可以对查询的结果进行merge
- merge有啥用： 以为着你们的查询promql或者alert配置文件无需关心数据到底存储在哪个存储里面
- 可以直接使用全局的聚合函数

## prometheus可以remote_read prometheus自己
> 感觉这个特点很多人不知道，以为remote_read必须配置第三方存储如 m3db等

## 所以结合上述两个特点就可以用多个采集的prometheus + 多个无状态的prometheus query实现prometheus的高可用方案
- 监控数据存储在多个采集器的本地，可以是机器上的prometheus
- 也可以是k8s中的prometheus statefulset
- prometheus query remote_read 填写多个`prometheus/api/v1/read/`地址

### 数据重复怎么办
- 不用管，上面提到了query会做merge，多个数据只会保留一份
- 到正可以利用这个特点模拟副本机制：
    - 重要的采集job由两个以上的采集prometheus采集
    - 查询的时候merge数据
    - 可以避免其中一个挂掉时没数据的问题
### 那么这种方案的缺点在哪里
- 并发查询必须要等最慢的那个返回才返回，所以如果有个慢的节点会导致查询速度下降，举个例子
    - 有个美东的节点，网络基础延迟是1秒，那么所有查询无论返回多快都必须叠加1秒的延迟
    
- 应对重查询时可能会把query打挂
    - 但也正是这个特点，会很好的保护后端存储分片
    - 重查询的基数分散给多个采集器了
- 由于是无差别的并发query，也就是说所有的query都会打向所有的采集器，会导致一些采集器总是查询不存在他这里的数据
     - 那么一个关键性的问题就是，查询不存在这个prometheus的数据的资源开销到底是多少
     - 据我观察，新版本速度还是很快的说明资源开销不会在很深的地方才判断出不属于我的数据
     - m3db有布隆过滤器来防止这个问题
- 如果想精确把query打向数据它的存储分片可以参考我之前写的route方案：[开源项目 : prome-route： 使用反向代理实现prometheus分片](https://zhuanlan.zhihu.com/p/231914857)
    - 主要哦，需要特征标签支持，并且数据天然就是分开的！！

### 可以加一些探活/管理采集器的逻辑来完善这个方案


# 如何验证
> 两个prometheus只配置采集本地一个node_exporter 的job
```yaml
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  query_log_file: /opt/logs/prometheus_query_log



scrape_configs:
  - job_name: node_exporter
    honor_timestamps: true
    scrape_interval: 15s
    scrape_timeout: 10s
    static_configs:
    - targets:
      - 192.168.0.106:9100

```
- 这样在单一prometheus中只能查询到自己的数据

> 启动一个m_query服务 ,multi_remote_read 多个采集器
```yaml
global:
  scrape_interval:     15s # Set the scrape interval to every 15 seconds. Default is every 1 minute.
  evaluation_interval: 15s # Evaluate rules every 15 seconds. The default is every 1 minute.
  query_log_file: /opt/logs/prometheus_query_log


remote_read:
  - url: "http://192.168.0.106:9090/api/v1/read"
    read_recent: true
  - url: "http://192.168.0.107:9090/api/v1/read"
    read_recent: true

```

> 验证在 m_query服务上，即可查到所有数据，达到替换m3db的目的

```shell script
node_cpu_seconds_total{cpu="0", mode="system"}
```