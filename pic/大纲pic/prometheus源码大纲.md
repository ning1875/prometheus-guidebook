

# 学习本课程的收益和目标

- 第1章 收益分析：学习优秀的go项目进大厂 or 实战调优进大厂 ： 40 min
    - 1.1 为什么学透prometheus可以进大厂
        - 监控系统在基础架构中的重要位置，如何为其他系统提供决策数据
        - 互联网有大厂专门的监控开发团队，2-10人
        - 为何大厂监控开发招聘要求熟悉prometheus
        - 大厂搞不定的prometheus问题有哪些
        - prometheus作为CNCF顶级项目，是学习go语言的标杆
    - 1.2 运维和运维开发同学在prometheus上的学习重点
        - 运维同学学习一线大厂监控调优实战，升职加薪
        - 运维开发同学深入了解prometheus源码，力争进入大厂监控开发岗位
    - 1.3 为什么本节课的老师最专业
        - 多年一线互联公司监控系统架构经验，原字节跳动基础监控核心开发人员
        - 对OpenFalcon有深度二次开发经验，滴滴夜莺核心开发人员之一
        - 熟读Prometheus源码、贡献多个周边开源项目
- 第2章  学习目标：达到进大厂监控开发岗位的要求   ：20 min
    - 2.1 目标
        - 熟悉prometheus 及其生态圈内的组件架构
        - 有prometheus及其生态圈内组件高并发调优方案
        - 熟悉prometheus核心源码，借鉴设计模式和优秀代码
        - 监控环节上的单点问题和实战高可用解决方案    


# prometheus基础篇

- 第3章 安装prometheus和上手使用 ：30min
    - 3.1 prometheus二进制安装
    - 3.2 ui功能讲解之graph页面
    - 3.3 ui其他页面讲解
    - 3.4 prometheus配置文件和6大模块讲解
    - 3.5 static_configs采集配置源码解读
    - 3.6 prometheus命令行参数讲解
    - 3.7 热更新源码解读

- 第4章 prometheus 基本概念介绍 ：50 min
    - 4.1 sample 数据点
    - 4.2 Label 标签
    - 4.3 Labels 标签组
    - 4.2 prometheus四种查询类型
    - 4.3 四种标签匹配模式
    - 4.6 四种数据类型
    - 4.7 时间范围选择器
    - 4.8 promql简介
- 第5章 node_exporter安装和使用：30 min
    - 5.1编写ansibleplaybook批量安装二进制
    - 5.2 黑白名单配置
    - 5.3 sdk指标和配置本地采集目录
    - 5.4 配置prometheus采集通过http请求参数过滤采集器
    - 5.5 node_exporter采集原理简介.md
    - 5.6 node_exporter二开新增自定义模块
- 第6章  grafana安装和使用：60 min
    - 6.1 rpm安装 和 文件目录讲解
    - 6.2 基础功能
        - 数据源操作
        - dashboard操作
        - folder操作
        - alerting操作
        - 用户和组操作
    - 6.3 panel中操作
        - 设置单位
        - panel改名
        - 曲线别名
        - 曲线sort
        - 曲线复制
        - 曲线静默
        - panel复制
        - 设置告警线
    - 6.4 设置表格tables
    - 6.5 使用变量查询
    - 6.6 使用dashboard商城搜索导入模板
    
- 第7章 黑盒探针blackbox_exporter安装和使用 ：30min
    - 7.1 使用ansible部署 blackbox_exporter
    - 7.2 页面访问http探测，模块和探针介绍
    - 7.3 多实例采集的说明relabel配置
    - 7.4 ssh探测和ping探测使用
    - 7.5 grafana上导入模板看图并讲解告警
    - 7.6 blackbox框架源码和http探测源码解读
    - 7.7 prometheus relabel address替换源码解析
    
- 第8章 mysqld_exporter安装和使用 ：30min
    - 8.1 使用ansible部署mysql_exporter，注入dsn环境变量
    - 8.2 grafana上导入模板看图并讲解告警
    - 8.3 修改mysqld_exporter源码 ，改造成类似blackbox的探针型，实现一对多探测
    
- 第9章 process-exporter安装和使用 ：20min
    - 9.1 使用ansible部署 process-exporter
    - 9.2 grafana 上导入模板看图并讲解告警
    - 9.3 查看源码，讲解采集原理，对比和atop的输出
    
- 第10章 redis-exporter安装和使用 ：20min
    - 10.1 使用ansible部署 redis-exporter
    - 10.2 grafana上导入模板看图并讲解告警
    - 10.3 查看源码，讲解采集原理
    
- 第11章 java应用监控jvm实例 ：30min
    - 11.1 监控kafka和zookeeper的jvm
    - 11.2 导入grafana大盘和指标讲解

- 第12章  pushgateway使用 : 40min
    - 12.1 应用场景和部署
    - 12.2 使用prometheus-sdk向pushgateway打点

- 第13章  告警和alertmanager简单使用 :30 min
    - 13.1 alertmanager核心功能点介绍和安装部署
    - 13.2 编写go程序充当告警触发端和接收端
    - 13.3 alertmanager分组功能
    - 13.4 告警抑制实例
    - 13.5 告警静默
    - 13.6 编写go代码接收webhook的告警发送钉钉

    
# 进阶篇
## k8s监控原理解析
> 分析问题和环境搭建
- 第14章  k8s监控难点分析 ： 30 min
    - 14.1 为什么说k8s中监控更复杂了 
    - 14.2 k8s中我们都需要监控哪些组件

    
- 第15章 k8s监控环境搭建，yaml讲解：50 min
    - 15.1 使用kubeadm 10分钟部署k8集群
    - 15.2 定义一个prometheus数据存储使用的pv
    - 15.3 StorageClass和volumeClaimTemplates
    - 15.4 prometheus使用的ClusterRole等RBAC对象
    - 15.5 创建监控控制平面的service
    - 15.6 创建prometheus使用的配置configmap
    - 15.7 创建prometheus的statsfulset配置
    - 15.8 在k8s部署prometheus statefulset
    - 15.9 grafana-deployment-yaml讲解
    - 15.10 在k8s部署grafana-deployment并导入k8s大盘
    
> 从k8s关注的4大指标入手，分析监控的原理

- 第16章 k8s容器基础资源指标 采集原理和指标讲解 : 40min 
    - 16.1 k8s容器基础资源指标采集原理讲解
    - 16.2 k8s容器基础资源指标讲解
    - 16.3 k8s容器cpu内存告警指标与资源request和limit
    
- 第17章 k8s对象资源指标 ：40min
    - 17.1 ksm关注指标讲解 pod和node状态的统计
    - 17.2 ksm源码讲解
    
- 第18章 k8s服务组件指标： 40min
    - 18.1 k8s服务组件之4大黄金指标讲解
    - 18.2 k8s-apiserver监控源码解读
    
- 第19章 k8s部署在pod中业务埋点指标：40min
    - 19.1 使用k8s的sdk编写一个项目获取pod和node信息
    - 19.2 编写dockerfile和k8s yaml
    - 19.3 打镜像部署到k8s中，prometheus配置采集并在grafana看图
    
> 分析prometheus为k8s做的4大适配工作

- 第20章 分析pull模型在k8s中的应用，对比push模型 ：30 min
    - 20.1 分析pull模型在k8s中的应用，对比push模型
    
- 第21章 k8s接口鉴权、认证和在监控中的实现 ：60min
    - 21.1 k8s接口鉴权token认证和prometheus的实现
    - 21.2 k8s中etcd的tls双向认证原理解析
     
- 第22章 k8s服务发现原理解析： 60min
    - 22.1 k8s不同role级别的服务发现
    - 22.2 k8s中ksm采集的使用的dns解析
    - 22.3 解读k8s服务发现源码
    
- 第23章 k8s监控中标签relabel的应用和k8s监控总结： 60min
    - 23.1 k8s监控中标签relabel的应用和原理
    - 23.2 prometheus为k8s做的4大适配工作
    


        
## 高可用 高性能采集相关

- 第24章  主流服务发现类型介绍，监控系统和服务树/CMDB如何打通： 30min
    - 24.1 prometheus-exporter管理
    - 24.2 prometheus target管理
    - 24.3 基于文件的服务发现模式
    - 24.4 基于consul服务发现模式
    - 24.5 基于http服务发现模式
    - 24.6 监控系统在采集侧对接运维平台
    
    
- 第25章 如何降低采集资源消耗：30min 
    - 25.1 降低采集资源消耗的收益和无用监控指标的判定依据
    - 25.2 采集端高基数的现象和原因
    - 25.3 使用relabel中的drop将对应的无用指标丢弃
    
- 第26章 分位值作用和原理：30min
    - 26.1 分位值summary和histogram对比
    - 26.2 histogram线性插值法源码解读
    - 26.3 summary源码解读
    
- 第27章 采集端高可用实战：60min
    - 27.1 采集端单点问题原因和危害，静态分片方案的弊端
    - 27.2 动态分片方案和它要解决的问题
    - 27.3 一致性哈希算法介绍
    - 27.4 一致性哈希算法的golang实现和迁移率测试
    - 27.5 go实战项目prome-shard的代码准备工作
    - 27.6 consul注册服务、抽象获取target的方法
    - 27.7 开启一致性哈希环变更监听处理和consul-watch服务
    - 27.8 把target做一致性哈希进行分发
    - 27.9 调用go-ansible执行playbook拷贝json文件重载采集器
    
- 第28章 go实战项目 动态分片解决pushgateway高可用： 30min
    - 28.1 pushgateway单点问题和动态分片方案介绍
    - 28.2 go实战项目dynamic-sharding的代码准备工作
    - 28.3 一致性哈希和推送数据的redirect流程
    - 28.4 编译运行测试效果
    
- 第29章 如何使用非侵入式形式如日志接入prometheus: 40min
    - 29.1 时序监控和日志监控的对比，分析日志监控的核心诉求
    - 29.2 golang实战项目log2metrics架构说明
    - 29.3 准备工作，编写配置文件，解析配置，校验正则，设置log
    - 29.4 日志任务增量更新管理器和具体的日志job对象
    - 29.5 日志消费组和日志正则处理对象AnalysPoint
    - 29.6 时序统计的结构体对象和metrics结果打点方法
    - 29.7 编译运行，读取日志配置看图


## 存储模块
- 第30章 时序数据库存储模型：30min
    - 30.1 时序数据库TSDB的典型特点
    - 30.2 不得不谈的lsm：分层结构和lsm数据结构
    
- 第31章  facebook-gorilla压缩算法原理 ：30min
    - 31.1 时序数据压缩的必要和facebook-gorilla压缩算法简介
    - 31.2 DOD压缩和相关的prometheus源码解读
    - 31.3 XOR压缩和相关的prometheus源码解读
   
- 第32章  prometheus自研tsdb底层原理 ：30min
    - 32.1 prometheus倒排索引源码解析
    - 32.2 prometheus倒排索引统计功能
    - 32.3 mmap的在io提速上的应用和prometheus的应用
    - 32.4 prometheus存储磁盘数据结构和存储参数
    - 32.5 compact目的和源码解读
    
- 第33章  集群tsdb原理和实战（一）： 30min
    - 33.1 prometheus本地存储单点问题和remote解决方案
    - 33.2 prometheus联邦功能源码解读和它的问题
    - 33.3 prometheus 低成本存储multi_remote_read方案说明
    - 33.4 为什么remote_read查询series比直接查询要慢很多和源码解读
    - 33.5 remote实战项目之设计prometheus数据源的结构
    - 33.6 read的代码，查询series方法和QueryEngine的RangeQuery方法
    - 33.7 write的代码编写和测试
    
- 第34章 m3db原理和实战：30min
    - 34.1 uber开源的m3db简介
    - 34.2 m3db上手搭建
    - 34.3 m3db-oom的内存火焰图和内存分配器加油模型源码解读
    - 34.4 m3db调优踩坑问题总结
    
- 第35章 thanos项目和组件源码解读
    - 35.1 thanos项目介绍和二进制部署
    - 35.2 thanos-sidecar源码阅读
    - 35.3 thanos-store 源码阅读
    - 35.4 thanos-query 源码阅读
    - 35.5 thanos-compactor 源码阅读
    - 35.6 thanos-rule 源码阅读
    
- 第36章 kube-prometheus和prometheus-operator原理和实战 : 30min
    - 36.1 kube-prometheus项目讲解和安装部署
    - 36.2 内置的k8s采集任务分析
    - 36.3 grafana-dashboard看图分析
    - 36.4 prometheus告警和预聚合分析
    - 36.5 自定义指标接入prometheus-operator

## 查询模块
- 第37章 prometheus核心接口源码解析 : 30min
    - 37.1 prometheus管理接口源码讲解
    - 37.2 prometheus分析接口源码讲解
    - 37.3 prometheus5大数据查询接口
    
- 第38章 范围查询分阶段原理 : 30min
    - 38.1 range_query和querylog源码解读
    
- 第39章 prometheus接口开发实战: 30min
    - 39.1 用最近1天的内存平均使用率等出业务资源利用率报表
    
- 第40章 高基数查询和prometheus预聚合原理和源码解读 : 30min
    - 40.1 高基数查询原因总结和判定高基数的依据
    - 40.2 预聚合和prometheus-record使用
    - 40.3 prometheus预聚合源码解读
    
- 第41章  查询提速实战提升查询速度30-100倍： 30min
    - 41.1 预聚合提速实战项目之需求分析和架构设计
    - 41.2 ansible拷贝日志文件，解析日志并判断重查询
    - 41.3 将重查询记录增量更新到consul和redis中
    - 41.4 修改confd源码增加静态分片功能
    - 41.5 nginx拦截prometheus查询请求使用lua脚本做promql的检查替换
    - 41.6 安装部署，效果测试，架构回顾

## 告警模块
- 第42章 告警触发prometheus源码解读和 告警触发模块高可用方案 ：40min
    - 42.1 从一条告警的触发分析prometheus alert告警源码
    - 42.2 告警触发trigger模块单点问题和高可用解决方案
    
- 第43章 alertmanager源码解读和实战： 40min
    - 43.1 配置alertmanager高可用并测试
    - 43.2 gossip协议解读
    - 43.3 alertmanager流水线处理源码解读
- 第44章 告警回调实战： 40min
    - 44.1 告警自愈之回调重启服务实战

# 课程卖点
## 1. 课程中go开发实战项目
- 5.6 node_exporter二开新增自定义模块
- 8.3 修改mysqld_exporter源码 ，改造成类似blackbox的探针型，实现一对多探测
- 13.2 编写go程序充当告警触发端和接收端
- 13.6 编写go代码接收webhook的告警发送钉钉
- 19.1 使用k8s的sdk编写一个项目获取pod和node信息，打镜像部署到k8s中，prometheus配置采集并在grafana看图
- 27.1 go实战项目prome-shard动态分片实现采集端高可用 
- 28.1 go实战项目dynamic-sharding 实现pushgateway高可用  
- 29.1 log2metrics使用非侵入式形式如日志接入prometheus
- 33.5 prom-remote项目remote读写prometheus存储
- 41.1 pre_query查询提速实战提升查询速度30-100倍

## 2. 全组件源码解读
## 3. k8s监控原理解析
