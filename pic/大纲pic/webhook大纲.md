
# k8s-webhook动态准入源码解读和实战运维开发课程

- 第1章 准入控制器k8s源码解读和准备工作
  - 1.1 webhook在k8s运维开发中的重要性
  - 1.2 什么是k8s的准入控制器
  - 1.3 准入控制器插件map数据结构
  - 1.4 解读几个典型的控制代码
  - 1.5 解读event限流控制器
  - 1.6 mutation类型webhook源码解读
  - 1.7 validating类型webhook源码解读
  - 1.8 学习官方文档中关于动态准入控制的介绍
  - 1.9 学习最佳实践

- 第2章 源码解读k8s官方e2e示例中的webhook
  - 2.1 解析官方e2e示例的main流程
  - 2.2 源码解读view处理函数
  - 2.3 serve通用逻辑
  - 2.4 解读hook函数之添加标签的几种判断情况
  - 2.5 解读hook函数之给pod注入init容器
  - 2.6 解读hook函数之剩余函数
  - 2.7 webhook源码示例的总结

- 第3章 参考e2e示例中的webhook写简单的
  - 3.1 新建项目准备工作
  - 3.2 找k8s源码中test生成证书
  - 3.3 自签生成证书的问题
  - 3.4 本地测试
  - 3.5 研究k8s源码test中如何部署webhook
  - 3.6 使用最古老的方式生成MutatingWebhookConfiguration
  - 3.7 部署到集群中遇到证书问题
  - 3.8 尝试解决
  - 3.9 部署MutatingWebhookConfiguration

- 第4章 使用certmanager管理证书
  - 4.1 部署certmanager
  - 4.2 使用cert生成证书部署MutatingWebhookConfiguration
  - 4.3 ca-bundle能否自动注入
  - 4.4 大型项目怎么部署 MutatingWebhookConfiguration 难道还要手写吗
  - 4.5 证书续签的问题
  - 4.6 查看你mwc中的证书信息
  - 4.7 准备问题复现的环境
  - 4.8 https服务端证书更新的问题
  - 4.9 思考为什么会出现这个问题

- 第5章 编写webhook的正确姿势
  - 5.1 添加tls-watcher逻辑
  - 5.2 部署到k8s集群中测试
  - 5.3 认识一下k8s-controller-runtime作用
  - 5.4 分析test中如何快速构建webhook
  - 5.5 用它来实战创建webhook之准备
  - 5.6 写个简单的逻辑试试
  - 5.7 添加addLabel的hook
  - 5.8 部署测试正常

- 第6章 开始webhook实战项目
  - 6.1 给sts的pod注入INDEX环境变量标识其序号需求说明
  - 6.2 编写代码之stsowner判断
  - 6.3 index判断和patch
  - 6.4 打包镜像部署到k8s集群测试遇到问题
  - 6.5 给web添加zap-logger打印日志
  - 6.6 更换一种patch思路
  - 6.7 解决之前的问题
  - 6.8 测试有sidecar和index覆盖的情况
  - 6.9 k8s官方的支持

- 第7章 webhook实战之consul代理注册
  - 7.1 搭建环境之consul-server 
  - 7.2 搭建环境之k8s中的consul-client-ds 
  - 7.3 使用golang注册服务
  - 7.4 curl注册服务
  - 7.5 代理注册的问题
  - 7.6 代码编写之添加容器ip变量
  - 7.7 拼接注册cmd之check
  - 7.8 完成所有的逻辑
  - 7.9 打包镜像部署到k8s集群测试发现问题
  - 7.10 解决curl命令的问题
  - 7.11 解决localhost-8500的问题
  - 7.12 测试扩容和注销的prestop

- 第8章 webhook实战之防删除
  - 8.1 沟通需求
  - 8.2 开始编码
  - 8.3 打包镜像部署到k8s集群测试遇到问题
  - 8.4 解决format的问题
  - 8.5 给master01扩容磁盘
  - 8.6 把docker和containerd改到新磁盘中

- 第9章 webhook实战之pod注入sidecar容器
  - 9.1 沟通需求
  - 9.2 开始编码
  - 9.3 解决harbor失败的问题
  - 9.4 打包镜像部署到k8s集群测试遇到问题
  - 9.5 清理非正常的pod

- 第10章 webhook实战之init容器准备工作
  - 10.1 沟通需求
  - 10.2 开始编码准备volume
  - 10.3 完成编码
  - 10.4 部署测试

- 第11章 webhook实战之监听namespace自动创建对象
  - 11.1 沟通需求
  - 11.2 开始编码之获取client
  - 11.3 完成编码
  - 11.4 部署测试发现缺少权限
  - 11.5 添加原始的kubeclient

- 第12章 webhook实战之监听ingress配置检查
  - 12.1 沟通需求
  - 12.2 开始编码
  - 12.3 打包镜像部署到k8s集群测试

- 第13章 webhook实战之k8s节点资源超卖
  - 13.1 沟通需求和准备基础环境
  - 13.2 开始编码之超卖参数
  - 13.3 完成逻辑
  - 13.4 打包镜像部署到k8s集群测试
  - 13.5 编写pod超卖的代码
  - 13.6 测试发现cpu取整的问题
  - 13.7 进行总结并赠送k8s中搭建使用harbor





# 开发webhook的踩坑点



> tls证书更新问题
- 主要是 webhook-https程序 没有处理tls cert文件更新，导致证书续期后webhook侧没更新
- mwc中的cabundle 你不要手写，直接使用certmanager 注入
- 准备参考 k8s controller-runtime 模块 添加watch cert文件更新，reload tls证书



> webhook 劫持范围
- namespaceSelector 只劫持指定namespace
- objectSelector 只过滤需要代理注册的服务


# k8s webhook 开发实战案例
- 给sts的pod注入INDEX环境变量标识其序号
- postStart 和preStop 实现未引用consul-sdk 类服务通过curl注册注销服务
- 资源防删除
- pod注入sidecar容器
- 监听namespace 自动创建secret
- ingress配置检查：检查svc port等是否存在
- 资源超卖
    - pod request资源改低
    - node 把node的allocatable调高
        - 等于是虚标 allocatable ，比如还剩下10G，但是我虚标成 100G
        - 反正usage比较低也没有什么影响




