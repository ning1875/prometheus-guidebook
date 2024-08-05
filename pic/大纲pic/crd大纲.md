



- 第1章 operator基础知识
- 第2章 K8s日志采集最佳实践
- 第3章 小白的第一个operator实战项目用kubebuilder生成
    - 3.1 日志operator需求和yaml设计
    - 3.2 用kubebuilder生成框架代码
    - 3.3 编写逻辑之定义日志后端写入管理器
    - 3.4 调谐logBackend处理新增的逻辑
    - 3.5 处理logBackend的status子资源
    - 3.6 新增完成后将spec更新到annotation中
    - 3.7 调谐处理logBackend的更新
    - 3.8 了解k8s对象删除流程和Finalizers
    - 3.9 给logBackend自定义删除终结器
    - 3.10 在日志管理器中删除lb
- 第4章 logoperator 中collectrule
  - 4.1 思考采集规则crd的yaml
  - 4.2 定义collectrule spec结构体
  - 4.3 将collectrule改成集群范围生效
  - 4.4 给调谐对象添加coreclient写个获取pod-log的demo
  - 4.5 调谐内部逻辑失败requeue的选择
  - 4.6 定义采集规则管理器
  - 4.7 单一采集规则对日志的处理函数
  - 4.8 修改之前的logbackend写入逻辑

- 第5章 collectrule采集主正则的处理
  - 5.1 collectrule采集主正则的处理逻辑
  - 5.2 准备打印日志的pod服务
  - 5.3 修复控制器重启不接管running的lb-cr的问题
  - 5.4 部署测试collectrule采集主正则

- 第6章 collectrule告警正则的处理
  - 6.1 编写发送钉钉的逻辑
  - 6.2 在collectrule中加入处理告警的逻辑
  - 6.3 部署测试告警正则

- 第7章 webhook校验用户配置的CRD
  - 7.1 webhook在collectrule中的应用
  - 7.2 kubebuilder 开启collectrule的webhook
  - 7.3 编写collectrule创建的校验方法
  - 7.4 部署证书管理器和webhook
  - 7.5 将logbackend_dir映射到宿主上
  - 7.6 创建cr验证webhook

- 第8章 collectrule的修改和删除
  - 8.1 collectrule的删除调谐
  - 8.2 collectrule的变更调谐

- 第9章 cicd流水线项目基础信息
  - 9.1 流水operator需求和yaml设计
  - 9.2 用kubebuilder生成框架代码
  - 9.3 编写MytaskSpec对象
  - 9.4 定义MytaskRunSpec对象
  - 9.5 MyTaskRun调谐新对象判定的新方法
  - 9.6 MyTaskRun中校验参数和ws
  - 9.7 MyTaskRun中创建pod的变量替换
  - 9.8 MyTaskRun中创建pod的公共volumes
  - 9.9 MyTaskRun为每个step生成容器和volume
  - 9.10 进行单step的测试
  
- 第10章 cicd流水线项目之clone-gen
  - 10.1 更新MyTaskRun的状态
  - 10.2 pod状态和step切换的效果测试
  - 10.3 容器执行命令改为脚本全路径
  - 10.4 流水线项目 git-clone 
  - 10.5 私有仓库ssh-key鉴权问题 
  - 10.6 生成推送镜像的随机字符串标签

- 第11章 cicd流水线项目之build-push-apply
  - 11.1 build和push
  - 11.2 go项目构建时引用私有仓库的解决方法
  - 11.3 上线到k8s之apply-yaml 
  - 11.4 上线到k8s之set-image

- 第12章 组合这些步骤成流水线
  - 12.1 修改kaniko代码支持从result读取image-url
  - 12.2 准备目标服务token-auth
  - 12.2 准备目标服务token-auth
  - 12.3 clone-build-push流水线
  - 12.4 set-image全流水线


- 自定义pipelines 和多租户系统
- operator开发总结心得

