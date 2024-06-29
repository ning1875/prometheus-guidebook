【模块7】cicd平台 第1-3 调研cicd和熟悉gitlab-ci
【模块7】cicd平台 第4-6 go项目ci流程和makefile
【模块7】cicd平台 第7-9 gomod使用ci的cache并安装harbor

# 【模块7】cicd平台

- 第1章 前置准备和调研工作
    - 1.1 从用户角度说一下cicd的需求
    - 1.2 直接部署的反面教材
    - 1.3 流程图调研
    - 1.4 我们设计流程和关键词
    - 1.5 组件选型

- 第2章 部署gitlab社区版本
    - 2.1 部署前置准备工作
    - 2.2 docker安装gitlab 研究了3小时
    - 2.3 访问验证测试ssh下载和提交
    - 2.4 简单学习gitlab-auto-devops 自动帮你写了个gitlab-ci-yml 依赖runner
    - 2.5 解释gitlab-ci流行原因
    - 2.6 熟悉一下gitlab-ci和runner

- 第3章 gitlab-runner安装和使用
    - 3.1 在ubuntu上apt安装runner
    - 3.2 尝试一个gitlab-ci-yml
    - 3.3 gitlab-ci文件中配置runner的tag
    - 3.4 学习gitlab-ci配置的目标
    - 3.5 学习gitlab-ci的关键字之default-image
    - 3.6 学习gitlab-ci的关键字之default-前后脚本-制品
    - 3.7 学习gitlab-ci的关键字之default-前后脚本-timeout
    - 3.8 学习gitlab-ci的关键字之include-stage
    - 3.9 学习gitlab-ci的关键字之自定义stage顺序
    - 3.10 学习gitlab-ci的关键字之environments

- 第4章 gitlab-ci-yaml使用
    - 4.1 学习gitlab-ci的关键字之need
    - 4.2 学习gitlab-ci的关键字之release
    - 4.3 学习gitlab-ci的关键字之rules-if
    - 4.4 Variable和when
    - 4.5 内置的变量
    - 4.6 简单了解对于go服务应该怎么弄流水线
    - 4.7 调研golang-ci流水线


- 第5章 准备golang项目并完成ci的项目
    - 5.1 准备待自定义logger的gin项目
    - 5.2 学习makeFile
    - 5.3 编写makeFile
    - 5.4 学习goVet
    - 5.5 学习Gofmt并改造项目为多目录的
    - 5.6 使用gofmt
    - 5.7 学习单元测试
    - 5.8 准备gin的单元测试
    - 5.9 带覆盖率的单测make命令
    - 5.10 构建image拼接命令
    - 5.11 dockerFile模板和makeFile传参

- 第6章 根据ci项目完成gitlab-ci-yaml
    - 6.1 基础的yaml定义stage
    - 6.2 调研go项目使用ci的cache
    - 6.3 准备项目和yaml
    - 6.4 改造go项目添加构建耗时并加k8s包
    - 6.5 遇到docker-ipv6的问题
    - 6.6 实验对比带不带缓存的速度
    - 6.7 为了独立测试再准备一个新的runner机器
    - 6.8 测试vet也需要缓存
    - 6.9 封装自己的golang-121的构建镜像
    - 6.10 解决问题开启ipv6

- 第7章 打包镜像
    - 7.1 尝试golangci_lint
    - 7.2 自己制作基于ubuntu22的go121镜像
    - 7.3 自制goproxy代理解决dns和连接问题
    - 7.4 goproxy使用window上的ssd-volume
    - 7.5 做proxy重启文件是否存在的验证
    - 7.6 补全静态代码检测
    - 7.7 构建拆成2部分二进制加镜像
    - 7.8 在golang镜像里面安装docker
    - 7.9 尝试dind后改用kaniko

- 第8章 安装私有harbor
    - 8.1 安装nfs-动态pv
    - 8.2 准备harbor的helm-chart-value
    - 8.3 解决pod报错
    - 8.4 使用harbor测试推送镜像
    - 8.5 harbor新建项目并测试用户权限
    - 8.6 镜像保留策略的测试
    - 8.7 尝试机器人账户

- 第9章 私有harbor和gitlab打通
    - 9.1 研究gitlab-ci配置推送凭证
    - 9.2 本地跑kanikobuild挂载docker-config-json
    - 9.3 分析镜像层的结果
    - 9.4 传参BIN_PATH再按层分析
    - 9.5 运行一下这个镜像的容器
    - 9.6 配置runner打通构建完成推送
    - 9.7 规范镜像的tag命名
    - 9.8 harbor的项目和gitlab-group对齐
    - 9.9 拼接git-tag
    - 9.10 添加job实现拼接tag
    - 9.11 镜像地址变量的覆盖问题
    - 9.12 整体的测试
    - 9.13 打tag触发并应用镜像清理策略


- 第10章 gitlab-ci-k8s-agent
    - 10.1 调研gitlab-ci怎么apply到k8s集群
    - 10.2 再调研
    - 10.3 安装一下gitlab-k8s-agent
    - 10.4 解决鉴权的问题
    - 10.5 k8s-agent权限问题
    - 10.6 把docker安装的gitlab改造成https的
    - 10.7 再来安装一下k8s-agent试试-果断放弃

- 第11章 kubeconfig挂载上去
    - 11.1 准备kubeconfig文件挂掉runner上面
    - 11.2 准备Deployment的模板并替换变量
    - 11.3 进行测试符合预期
    - 11.4 k8s的containerd支持私有harbor拉取镜像

- 第12章 代码cd到k8s-dev集群的正确步骤之改造后端
    - 12.1 思考正确用法
    - 12.2 模拟打通k8s模块-后端代码改造服务树校验-ci调用这个接口
    - 12.3 后端增加基于集群和app名称的查询接口
    - 12.4 思考改造服务树校验
    - 12.5 改造用户表支持服务账号
    - 12.6 jwt鉴权中间件改造支持服务账号跳过
    - 12.7 casbin鉴权中间件改造
    - 12.8 服务树校验改造

- 第13章 代码cd到k8s-dev集群之gitlab-ci适配
    - 13.1 先去获取k8sApp的id
    - 13.2 完成Deploy中拼接的逻辑
    - 13.3 进行测试发现shell不好调整变量
    - 13.4 shell写json文件再post
    - 13.5 调整一下传参
    - 13.6 建一个go-app的k8s应用
    - 13.7 测试多分支的泳道的思路
    - 13.8 测试image_url变量的传递
    - 13.9 Deploy中需要判断新增或更新
    - 13.10 新建分支修改代码重跑流水线
    - 13.11 pod携带新的分支标签

- 第14章 公共ci-yaml的仓库，实现业务传参
    - 14.1 为什么要做公共的
    - 14.2 新建公共模板仓库
    - 14.3 测试什么变量都不传-只是把yaml挪到了公共仓库中
    - 14.4 测试传入不存在的k8sApp
    - 14.5 解决curl接口没结果要failed流水线
    - 14.6 测试job的覆盖
    - 14.7 添加一个job来检测必备的变量是否传入了
    - 14.8 全流水线测试
    - 14.9 新建项目
    - 14.10 修复goproxy问题
    - 14.11 完整的cicd流水线go代码-ci检测-harbor镜像-k8s-app
    - 14.12 下一步的计划

- 第15章 cd服务发布项
    - 15.1 思考一下如果发布到k8s集群需要什么
    - 15.2 build+构建镜像的流水线
    - 15.3 改造镜像拼接逻辑-tag的时候直接用tag
    - 15.4 服务发布项表设计
    - 15.5 发布工单表设计
    - 15.6 mock发布项数据
    - 15.7 服务树节点添加研发负责人和工程师人员列表
    - 15.8 构造发布工单数据
    - 15.9 获取审批人列表

      【模块7】cicd平台 第16-18 后端走通发布一个stage流程

- 第16章 后端走通发布一个stage流程
    - 16.1 定义发布阶段表
    - 16.2 改造发布项的发布阶段
    - 16.3 gorm事务创建工单联动创建发布阶段状态
    - 16.4 解决k8s-mock耗时高的问题
    - 16.5 测试事务创建的结果
    - 16.6 审批发布工单的逻辑
    - 16.7 检查操作人是否有这个工单对应服务树节点权限
    - 16.8 执行发布阶段的接口准备
    - 16.9 发布阶段的接口联动k8s实例
    - 16.10 测试审批接口
    - 16.11 测试发布阶段接口

- 第17章 stage的轮转
    - 17.1 统一更新stage的状态
    - 17.2 总结stage状态的切换
    - 17.3 stage的测试结果更新
    - 17.4 准备菜单
    - 17.5 list表格
    - 17.6 form表单准备绑定服务发布项的树节点
    - 17.7 测试
    - 17.8 gitlab获取版本号的接口
    - 17.9 调研gitlab-go的sdk并使用
    - 17.10 后端接口中支持gitlab接口
    - 17.11 测试并完成获取项目的tag列表

- 第18章 发布工单的前端
    - 18.1 工单中用服务发布项替换服务树
    - 18.2 尝试服务发布项下拉列表变化联动环境
    - 18.3 再通过发布项id去获取gitlab标签列表
    - 18.4 表单中展示gitlab仓库地址
    - 18.5 完成联动
    - 18.6 创建发布工单的接口
    - 18.7 调整表格
    - 18.8 跳转工单详情和查询one的接口
    - 18.9 思考前端布局

- 第19章 服务树前端绑定服务发布项
    - 19.1 回顾一下服务树页面开发
    - 19.2 根据树节点id获取服务发布项
    - 19.3 展示服务发布项的基本信息
    - 19.4 stage列表的展示
    - 19.5 换成表格展示
    - 19.6 编辑的模态框
    - 19.7 测试编辑传参
    - 19.8 一键添加多个字段
    - 19.9 集群和k8s应用id的选择
    - 19.10 修复id选择大小写问题
    - 19.11 解决动态表单编辑的问题

- 第20章 服务发布项的后端接口
    - 20.1 创建服务发布项的接口
    - 20.2 前端进行测试
    - 20.3 解决treeNodeId传参问题
    - 20.4 解决没有发布项节点报错
    - 20.5 编辑树节点后刷新问题
    - 20.6 更新的接口前端复用按钮
    - 20.7 后端限制服务发布项操作权限
    - 20.8 前端限制权限的做法添加canAdmin的字段
    - 20.9 前端判断按钮
    - 20.10 删除服务发布项的逻辑

- 第21章 继续发布工单工作
    - 21.1 回顾工单的开发进度
    - 21.2 基础详情信息和布局
    - 21.3 用Description组件展示详情
    - 21.4 可选审批人获取的逻辑
    - 21.5 后端服务树节点编辑研发负责人
    - 21.6 前端测试
    - 21.7 解决preload的问题
    - 21.8 同理编写研发工程师功能
    - 21.9 递归查找工单可审批人
    - 21.10 子级覆盖父级的逻辑

- 第22章 工单审批的
    - 22.1 前端展示审批人
    - 22.2 审批按钮的逻辑
    - 22.3 审批的接口
    - 22.4 测试正常
    - 22.5 页面刷新的问题和重复审批
    - 22.6 工单的时间轴数据准备
    - 22.7 时间轴添加审批结果
    - 22.8 添加审批时间的字段固化审批流程

- 第23章 工单执行的逻辑
    - 23.1 展示发布阶段的准备
    - 23.2 发布阶段的表格准备
    - 23.3 测试表格
    - 23.4 字段调整
    - 23.5 时间轴展示所有stage
    - 23.6 调整审批通过的节点状态
    - 23.7 解决stage填充调用工单再调用stage递归fill的问题
    - 23.8 测试发布按钮
    - 23.9 是否可以显示发布的按钮
    - 23.10 完成逻辑按钮判断的逻辑
    - 23.11 进行测试发现问题
    - 23.12 更换id计数逻辑

- 第24章 工单stage的发布
    - 24.1 前端测试
    - 24.2 测试按钮的显示逻辑
    - 24.3 测试按钮的接口联调
    - 24.4 stage添加detail字段
    - 24.5 联调展示结果
    - 24.6 single集群发布结果检查
    - 24.7 执行工单状态变化
    - 24.8 textArea展示详情能否美化

- 第25章 工单stage的回滚
    - 25.1 回滚的调研：就找到这个Deployment 回滚它上一个版本
    - 25.2 查看k8s源码回滚Deployment的逻辑
    - 25.3 我们写回滚能否直接用接口而不是自己写逻辑
    - 25.4 写回滚方法
    - 25.5 测试回滚同时修复了imagePullSecret的bug
    - 25.6 回滚的前端设计 没发布不能回滚
    - 25.7 获取上一个版本
    - 25.8 上一张工单没结束不能创建新的工单

- 第26章 灰度发布之OpenKruise
    - 26.1 进行调研：stage到prod的灰度vs单一集群多副本之间的灰度
    - 26.2 k8s灰度发布调研
    - 26.3 OpenKruise简介和安装
    - 26.4 原地升级的介绍
    - 26.5 准备nginx定制首页
    - 26.6 测试原地升级

- 第27章 OpenKruise的rollout
    - 27.1 Deployment的滚动升级
    - 27.2 Deployment的暂停准备
    - 27.3 举例说明pause的问题
    - 27.4 按比例暂停调研
    - 27.5 安装并准备环境
    - 27.6 实验rollout的canary遇到不兼容的问题
    - 27.7 发现版本问题
    - 27.8 重新弄原来的版本
    - 27.9 再实验

- 第28章 解读rollout的细节
    - 28.1 rollout的配置
    - 28.2 安装ingress-nginx控制器
    - 28.3 测试ingress访问
    - 28.4 发布策略之金丝雀：访小范围的新版本，直接观察新版本的效果：拿真实的流量进行测试
    - 28.5 改造index程序打印版本
    - 28.6 ab测试之header访问：原有访问不受限制：加个特殊的header才能访问：给研发人员测试用的
    - 28.7 准备ingress-nginx 灰度环境
    - 28.8 完成测试
    - 28.9 研究ab的原理

- 第29章 cicd模块如何整合rollout之准备工作
    - 29.1 我们的灰度发布需求
    - 29.2 灰度配置位置工单or发布项
    - 29.3 发布项添加灰度选项
    - 29.4 yaml配置项的检查
    - 29.5 修改更新时的配置
    - 29.6 在发布阶段中支持副本数
    - 29.7 发现发布dep名称不能带tag
    - 29.8 进行改造
    - 29.9 测试正常
    - 29.10 准备k8s应用之go-app-01


- 第30章 cicd模块如何整合rollout
    - 30.1 准备镜像把Deployment调整为running
    - 30.2 发现stage关闭工单的bug
    - 30.3 新增关闭按钮
    - 30.4 回滚拼接Deployment名称修改
    - 30.5 先来拼接一下rollout对象
    - 30.6 rollout-api创建
    - 30.7 先写demo
    - 30.8 在stage-api中添加创建rollout对象
    - 30.9 测试

- 第31章 cicd模块如何整合rollout
  - 31.1 测试rollout暂停
  - 31.2 stage添加rollout-message
  - 31.3 展示灰度信息
  - 31.4 展示rollout状态
  - 31.5 研究tools中是如何approve的
  - 31.6 完成approve的接口
  - 31.7 增加rollout审批的按钮发现patch的问题
  - 31.8 解决更新status的问题
  - 31.9 灰度按钮的show
  - 31.10 准备测试数据

- 第32章 灰度发布收尾
  - 32.1 进行灰度测试
  - 32.2 展示新旧pod的状态的接口
  - 32.3 准备podList的drawer
  - 32.4 联调接口发现表格问题
  - 32.5 解决表格问题
  - 32.6 展示版本颜色
  - 32.7 展示pod-hash和日志
  - 32.8 进行调整
  - 32.9 进行一个完整的测试

- 第33章 灰度发布结合ingress进行header测试
  - 33.1 确定ingress和svc
  - 33.2 修改一下后端代码区分版本
  - 33.3 测试2.0和3.0的效果
  - 33.4 修改king的服务发布项添加ingress灰度
  - 33.5 解决match-header带不上的问题
  - 33.6 升级rollout到0.5.0

- 第34章 前端bigdevops-fe打包部署到k8s中
  - 34.1 vben打包问题01
  - 34.2 尝试解决rollup报错失败
  - 34.3 经对比原版后定位问题
  - 34.4 env环境变量导入的问题
  - 34.5 websocket地址配置正确姿势
  - 34.6 viteproxy总结
  - 34.7 打包并解决Preview的报错
  - 34.8 构建镜像尝试遇到问题
  - 34.9 修改nginx配置文件
  - 34.10 总结前端打包问题
  - 34.11 部署前端项目到k8s中
  - 34.12 试一下nginx.conf配置configmap
  - 34.13 解决subpath挂载的问题
  - 34.14 改变一下后端地址重新加载configmap

- 第35章 后端bigdevops-be打包部署到k8s中
  - 35.1 后端server打包并准备Deployment-yaml
  - 35.2 server部署到k8s中测试
  - 35.3 webhook的编译和部署k8s
  - 35.4 整理一下文件
  - 35.5 整理一下镜像推送阿里云
  - 35.6 写个ingress测试一下前后端
  - 35.7 grpc-agent部署到k8s的ds中
  - 35.8 ds调整为hostNetwork
  - TODO 35.9 把ds中调通



kubectl patch rollout rollout-k8s-app-go01 --type=merge --subresource status --patch 'status: {canaryStatus: {currentStepState:StepReady}}'



- TODO 执行的时间轴 stage的发布 测试 流程流转前后端 回滚
- 灰度发布


- 18.9 先展示一些详情信息

服务发布项 创建时要添加git仓库的id和名称
glpat-YrnVSW9ahzhnK5q_mBYi

PART01：ci完整流程：测试类、构建镜像(harbor) DONE
PART02：打通部署到k8s测试集群：快速 频繁 没有工单 DONE
PART03：cd服务发布项 服务发布工单
PART04：灰度发布

TODO：公共ciyaml的仓库业务传参
TODO：cd服务发布项 服务发布工单
TODO：灰度发布

7模块go大运维平台cicd模块开发前置调研
7模块go大运维平台之 cicd模块之 gitlab-ci的基础课程之after-scripts

- 9.3 TODO 构建镜像的时候 需要去掉源码目录
- 9.2 配置runner实现容器挂载docker-config-json

> gitlab-ci使用缓存 提速go项目构建

- 2个方面
    - 01 1个流水线的多个job 使用cache 达到：只下载1次
    - 02 runner 挂载宿主机的go mod目录，多个流水线共享

> 测试环境golang流水线 https://yuyy.info/?p=1946

- lint
- test
- build
    - makeFile 好处是入口是标准的：main.go 根下或者/cmd下面
    - 构建的时候的go mod proxy，内部应该还有私有仓库
    - 构建golang 的runner的镜像自己做
- deploy

TODO: 在k8s中部署runner
TODO:
对于go服务应该怎么弄流水线  https://gitlab.com/gitlab-org/gitlab/-/blob/master/lib/gitlab/ci/templates/Go.gitlab-ci.yml

- 虚拟机 rsync
- k8s

# 在docker中使用kaniko构建

```shell
docker tag gcr.io/kaniko-project/executor:v1.14.0-debug registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/kaniko-executor:v1.14.0-debug
docker push registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/kaniko-executor:v1.14.0-debug

```

# 在k8s中安装harbor

## 安装nfs 动态pv提供者

## 使用nfs-Provisioner 动态提供pv

### 步骤01 服务端安装nfs

- 我们这里选择k8s的master 节点为nfs的服务端
- 因为centos7自带了rpcbind，所以不用安装rpc服务，rpc监听在111端口，可以使用ss -tnulp | grep
  111查看rpc服务是否自动启动，如果没有启动，就systemctl start rpcbind 启动rpc服务
- rpc在nfs服务器搭建过程中至关重要，因为rpc能够获得nfs服务器端的端口号等信息，nfs服务器端通过rpc获得这些信息后才能连接nfs服务器端。

```shell script
[root@k8s-master01 statefulset]# ss -tnlp |grep rpc       
LISTEN     0      128          *:111                      *:*                   users:(("rpcbind",pid=3497,fd=4),("systemd",pid=1,fd=69))
LISTEN     0      128         :::111                     :::*                   users:(("rpcbind",pid=3497,fd=6),("systemd",pid=1,fd=71))
yum -y install nfs-utils


sudo apt install nfs-kernel-server nfs-common -y 


```

> 编辑/etc/exports ，添加以下内容

```shell script
/data/nfs/k8s  *(rw,sync,no_root_squash)
```

- /data/k8s：是共享的数据目录

- *：表示任何人都有权限连接，当然也可以是一个网段，一个 IP，也可以是域名
- rw：读写的权限
- sync：表示文件同时写入硬盘和内存
- no_root_squash：当登录 NFS 主机使用共享目录的使用者是 root 时，其权限将被转换成为匿名使用者，通常它的 UID 与 GID，都会变成
  nobody 身份

> 启动nfs服务

- 启动服务

```shell script
systemctl start nfs ;systemctl enable nfs 
```

> 使用rpcinfo 检查 nfs的端口

```shell script
root@k8s-master01 statefulset]# rpcinfo -p localhost
   program vers proto   port  service
    100000    4   tcp    111  portmapper
    100000    3   tcp    111  portmapper
    100000    2   tcp    111  portmapper
    100000    4   udp    111  portmapper
    100000    3   udp    111  portmapper
    100000    2   udp    111  portmapper
    100024    1   udp  35823  status
    100005    1   udp  20048  mountd
    100005    1   tcp  20048  mountd
    100024    1   tcp  49000  status
    100005    2   udp  20048  mountd
    100005    2   tcp  20048  mountd
    100005    3   udp  20048  mountd
    100005    3   tcp  20048  mountd
    100003    3   tcp   2049  nfs
    100003    4   tcp   2049  nfs
    100227    3   tcp   2049  nfs_acl
    100003    3   udp   2049  nfs
    100003    4   udp   2049  nfs
    100227    3   udp   2049  nfs_acl
    100021    1   udp  34801  nlockmgr
    100021    3   udp  34801  nlockmgr
    100021    4   udp  34801  nlockmgr
    100021    1   tcp  36864  nlockmgr
    100021    3   tcp  36864  nlockmgr
    100021    4   tcp  36864  nlockmgr
```

> 检查nfs配置

```shell script
[root@k8s-master01 statefulset]# showmount -e localhost
Export list for localhost:
/data/nfs/k8s 
```

> 创建目录添加测试文件,更改权限

```shell script
mkdir -pv /data/nfs/k8s
echo "nfs test" >>/data/nfs/k8s/nfs_test.txt

chown -R nfsnobody.nfsnobody /data/nfs/k8s
```

### 步骤02 客户端安装nfs

- 安装

```shell script
 yum -y install nfs-utils 
```

- 使用showmount -e masterip 查看

```shell script
[root@k8s-node01 ~]# showmount -e 172.20.70.205
Export list for 172.20.70.205:
/data/nfs/k8s *
```

- 挂载至本地/mnt目录，查看测试文件的内容，如果能看到内容说明正常

```shell script
mount -t nfs 172.20.70.205:/data/nfs/k8s /mnt
cat /mnt/nfs_test.txt
nfs test
```

### 步骤3 安装nfs-client 自动配置程序

- 要使用 StorageClass，我们就得安装对应的自动配置程序，比如我们这里存储后端使用的是 nfs，那么我们就需要使用到一个
  nfs-client 的自动配置程序，我们也叫它 Provisioner
- 这个程序使用我们已经配置好的 nfs 服务器，来自动创建持久卷，也就是自动帮我们创建 PV。
    - 自动创建的 PV 以${namespace}-${pvcName}-${pvName}这样的命名格式创建在 NFS 服务器上的共享数据目录中
    - 而当这个 PV 被回收后会以archieved-${namespace}-${pvcName}-${pvName}这样的命名格式存在 NFS 服务器上。

> 项目地址

- [nfs-subdir-external-provisioner](https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner)

#### 安装过程

- 首先将代码 clone下来

```shell script
git clone  https://github.com/kubernetes-sigs/nfs-subdir-external-provisioner.git
```

- 然后部署rbac鉴权相关

```shell script
NS=$(kubectl config get-contexts|grep -e "^\*" |awk '{print $5}')
NAMESPACE=${NS:-default}
sed -i'' "s/namespace:.*/namespace: $NAMESPACE/g" ./deploy/rbac.yaml ./deploy/deployment.yaml
kubectl create -f deploy/rbac.yaml
```

- 然后就是部署nfs-subdir-external-provisioner应用，这里会遇到镜像拉取失败的问题，由于是k8s.gcr.io所以被墙了

```shell script
image: k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
```

##### 利用阿里云构建海外项目的镜像

- 首先fork nfs-subdir-external-provisioner 项目到自己的github上，

```shell script
https://github.com/ning1875/nfs-subdir-external-provisioner
```

> 这里以之前的kube-prometheus 为例

- 在阿里的个人账号上做容器镜像服务 地址https://cr.console.aliyun.com/cn-beijing/instance/repositories
- 在你自己的GitHub上fork你想要拉去镜像的仓库 ，比如ksm
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/78b5ed813d9343b0b128d77960ee3e25.png)
- 到阿里云的容器镜像创建仓库，选公开
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/c68653b1bdf449eb8c3e77f13598bd97.png)
- 绑定GitHub仓库
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/1d63a835fcdb430196bccae14a266b92.png)
- 添加构建规则
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/e8ba1f23f23c432ca104594ec7375dbc.png)
- 根据tag添加规则
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/e73a437eb14045ebb2ef4c4a94751a97.png)
- 点击立即构建
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/d84d3ddcd6a941568392a6b289dfa66a.png)
- 等待构建结果
- ![image.png](https://fynotefile.oss-cn-zhangjiakou.aliyuncs.com/fynote/908/1631407698000/8624c81385e9417a8777e473082a3f80.png)

- 可以看到还是构建失败了，原因是DockerFile中是直接拷贝编译的二进制的，而编译的过程由make命令触发

```shell script
FROM gcr.io/distroless/static:latest
LABEL maintainers="Kubernetes Authors"
LABEL description="NFS subdir external provisioner"
ARG binary=./bin/nfs-subdir-external-provisioner

COPY ${binary} /nfs-subdir-external-provisioner
ENTRYPOINT ["/nfs-subdir-external-provisioner"]
```

- 所以我们得手动将 go build的命令添加到 DockerFile中
  ，比如我个提交 ：https://github.com/ning1875/nfs-subdir-external-provisioner/commit/7c0ebc8b618c47ca37fe6499e26ab8114f620445

- 然后编辑Deployment文件，将镜像替换为我们自己的

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nfs-client-provisioner
  labels:
    app: nfs-client-provisioner
  # replace with namespace where provisioner is deployed
  namespace: default
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: nfs-client-provisioner
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      serviceAccountName: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          #image: k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          #image: quay.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          #image: quay.io/external_storage/nfs-client-provisioner:latest
          image: registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/nfs-subdir-external-provisioner:v4.0.2
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: k8s-sigs.io/nfs-subdir-external-provisioner
            - name: NFS_SERVER
              value: 172.20.70.205
            - name: NFS_PATH
              value: /data/nfs/k8s
      volumes:
        - name: nfs-client-root
          nfs:
            server: 172.20.70.205
            path: /data/nfs/k8s
```

##### 替换nfs-client-provisioner中的nfs-server信息

- 填写nfs服务端地址和 nfs的挂载路径

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nfs-client-provisioner
  labels:
    app: nfs-client-provisioner
  # replace with namespace where provisioner is deployed
  namespace: default
spec:
  replicas: 1
  strategy:
    type: Recreate
  selector:
    matchLabels:
      app: nfs-client-provisioner
  template:
    metadata:
      labels:
        app: nfs-client-provisioner
    spec:
      serviceAccountName: nfs-client-provisioner
      containers:
        - name: nfs-client-provisioner
          #image: k8s.gcr.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          #image: quay.io/sig-storage/nfs-subdir-external-provisioner:v4.0.2
          #image: quay.io/external_storage/nfs-client-provisioner:latest
          image: registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/nfs-subdir-external-provisioner:v4.0.2
          volumeMounts:
            - name: nfs-client-root
              mountPath: /persistentvolumes
          env:
            - name: PROVISIONER_NAME
              value: k8s-sigs.io/nfs-subdir-external-provisioner
            - name: NFS_SERVER
              value: 172.20.70.205
            - name: NFS_PATH
              value: /data/nfs/k8s
      volumes:
        - name: nfs-client-root
          nfs:
            server: 172.20.70.205
            path: /data/nfs/k8s
```

- 然后apply 创建这个dep

```shell script
[root@k8s-master01 deploy]# kubectl get pod
NAME                                      READY   STATUS      RESTARTS   AGE
nfs-client-provisioner-78577dfbf6-wht7j   1/1     Running     0          58m
```

- 然后查看nfs-client-provisioner的日志

```shell script
[root@k8s-master01 nfs-subdir-external-provisioner-master]# kubectl logs nfs-client-provisioner-78577dfbf6-wht7j  -f 
I1018 20:13:04.006654       1 leaderelection.go:242] attempting to acquire leader lease  default/k8s-sigs.io-nfs-subdir-external-provisioner...
I1018 20:13:21.619515       1 leaderelection.go:252] successfully acquired lease default/k8s-sigs.io-nfs-subdir-external-provisioner
I1018 20:13:21.619760       1 controller.go:820] Starting provisioner controller k8s-sigs.io/nfs-subdir-external-provisioner_nfs-client-provisioner-78577dfbf6-wht7j_d90ece08-5c20-4514-b31b-f7d4711dea54!
I1018 20:13:21.619941       1 event.go:278] Event(v1.ObjectReference{Kind:"Endpoints", Namespace:"default", Name:"k8s-sigs.io-nfs-subdir-external-provisioner", UID:"f84f9471-32d5-42e3-9ee1-75b43815d0f6", APIVersion:"v1", ResourceVersion:"1226826", FieldPath:""}): type: 'Normal' reason: 'LeaderElection' nfs-client-provisioner-78577dfbf6-wht7j_d90ece08-5c20-4514-b31b-f7d4711dea54 became leader
I1018 20:13:21.720089       1 controller.go:869] Started provisioner controller k8s-sigs.io/nfs-subdir-external-provisioner_nfs-client-provisioner-78577dfbf6-wht7j_d90ece08-5c20-4514-b31b-f7d4711dea54!


```

##### 部署  storage class

- 就是apply deploy/class.yaml

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: managed-nfs-storage
provisioner: k8s-sigs.io/nfs-subdir-external-provisioner # or choose another name, must match deployment's env PROVISIONER_NAME'
parameters:
  pathPattern: "${.PVC.namespace}/${.PVC.annotations.nfs.io/storage-path}" # waits for nfs.io/storage-path annotation, if not specified will accept as empty string.
  onDelete: delete
```

- 检查sc

```shell script
[root@k8s-master01 deploy]# kubectl get sc 
NAME                   PROVISIONER                                   RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
managed-nfs-storage    k8s-sigs.io/nfs-subdir-external-provisioner   Delete          Immediate              false                  10s
```

##### 部署测试 pod

```shell script
kubectl create -f deploy/test-claim.yaml -f deploy/test-pod.yaml
```

- 分析一下test-claim.yaml ，代表使用上面创建的managed-nfs-storage 的storageClass 创建一个静态的pvc

```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: test-claim
spec:
  storageClassName: managed-nfs-storage
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Mi

```

- 分析一下test-pod.yaml ，里面通过上面的pvc使用 volume

```yaml
kind: Pod
apiVersion: v1
metadata:
  name: test-pod
spec:
  containers:
    - name: test-pod
      image: busybox:stable
      command:
        - "/bin/sh"
      args:
        - "-c"
        - "touch /mnt/SUCCESS && exit 0 || exit 1"
      volumeMounts:
        - name: nfs-pvc
          mountPath: "/mnt"
  restartPolicy: "Never"
  volumes:
    - name: nfs-pvc
      persistentVolumeClaim:
        claimName: test-claim

```

- 然后检查pv 和pvc ，可以看到 创建了一个名为test-claim的pvc
- 同时创建了一个pvc-299377f9-360d-4a5d-85e5-3946a686a8d8的pv

```shell script
[root@k8s-master01 nfs-subdir-external-provisioner-master]# kubectl get pvc
NAME          STATUS   VOLUME                                     CAPACITY   ACCESS MODES   STORAGECLASS           AGE
grafana-pvc   Bound    grafana-pv                                 10Gi       RWO            grafana-storageclass   6d10h
test-claim    Bound    pvc-299377f9-360d-4a5d-85e5-3946a686a8d8   1Mi        RWX            managed-nfs-storage    2m46s
[root@k8s-master01 nfs-subdir-external-provisioner-master]# kubectl get pv
NAME                                       CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS        CLAIM                                      STORAGECLASS           REASON   AGE
grafana-pv                                 10Gi       RWO            Retain           Bound         default/grafana-pvc                        grafana-storageclass            6d10h
prometheus-lpv-0                           10Gi       RWO            Retain           Terminating   kube-system/prometheus-data-prometheus-0   prometheus-lpv                  7d1h
pvc-299377f9-360d-4a5d-85e5-3946a686a8d8   1Mi        RWX            Delete           Bound         default/test-claim                         managed-nfs-storage             2m47s
[root@k8s-master01 nfs-subdir-external-provisioner-master]# 
```

- 这时候我们去nfs存储上查看发现多了default/SUCCESS文件，这是test-pod创建的

```shell script
[root@k8s-master01 nfs-subdir-external-provisioner-master]# ll /data/nfs/k8s/default/SUCCESS
-rw-r--r-- 1 root root 0 Oct 18 21:22 /data/nfs/k8s/default/SUCCESS
```

- 同时观察nfs-client-provisioner的日志，可以看到相关的pv和pvc创建过程

```shell script
[root@k8s-master01 deploy]# kubectl logs nfs-client-provisioner-78577dfbf6-5vc8k  -f 
I1018 21:22:30.465733       1 controller.go:1317] provision "default/test-claim" class "managed-nfs-storage": started
I1018 21:22:30.475689       1 event.go:278] Event(v1.ObjectReference{Kind:"PersistentVolumeClaim", Namespace:"default", Name:"test-claim", UID:"299377f9-360d-4a5d-85e5-3946a686a8d8", APIVersion:"v1", ResourceVersion:"1236396", FieldPath:""}): type: 'Normal' reason: 'Provisioning' External provisioner is provisioning volume for claim "default/test-claim"
I1018 21:22:30.478079       1 controller.go:1420] provision "default/test-claim" class "managed-nfs-storage": volume "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8" provisioned
I1018 21:22:30.478117       1 controller.go:1437] provision "default/test-claim" class "managed-nfs-storage": succeeded
I1018 21:22:30.478137       1 volume_store.go:212] Trying to save persistentvolume "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8"
I1018 21:22:30.491054       1 volume_store.go:219] persistentvolume "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8" saved
I1018 21:22:30.491376       1 event.go:278] Event(v1.ObjectReference{Kind:"PersistentVolumeClaim", Namespace:"default", Name:"test-claim", UID:"299377f9-360d-4a5d-85e5-3946a686a8d8", APIVersion:"v1", ResourceVersion:"1236396", FieldPath:""}): type: 'Normal' reason: 'ProvisioningSucceeded' Successfully provisioned volume pvc-299377f9-360d-4a5d-85e5-3946a686a8d8
```

- 这时候删掉 test-pod和test-claim

```shell script
[root@k8s-master01 nfs-subdir-external-provisioner-master]# kubectl delete -f deploy/test-pod.yaml -f deploy/test-claim.yaml
pod "test-pod" deleted
persistentvolumeclaim "test-claim" deleted
```

- 发现nfs存储上的 default/SUCCESS文件已经被删除

```shell script
[root@k8s-master01 nfs-subdir-external-provisioner-master]# ll /data/nfs/k8s/default/SUCCESS
ls: cannot access /data/nfs/k8s/default/SUCCESS: No such file or directory
[root@k8s-master01 nfs-subdir-external-provisioner-master]# ll /data/nfs/k8s/
total 4
-rw-r--r-- 1 nfsnobody nfsnobody 9 Oct 18 18:07 nfs_test.txt
```

- 同时可以发现日志打印了删除的过程

```shell script
I1018 21:29:37.944297       1 controller.go:1450] delete "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8": started
I1018 21:29:37.953587       1 controller.go:1478] delete "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8": volume deleted
I1018 21:29:37.958011       1 controller.go:1524] delete "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8": persistentvolume deleted
I1018 21:29:37.958033       1 controller.go:1526] delete "pvc-299377f9-360d-4a5d-85e5-3946a686a8d8": succeeded

```

- 到这里说明我们基于nfs的动态pv已经搭建完毕

# 解决gomod 拉取包报ipv6的错误

> 错误

```shell
.go/pkg/mod/github.com/golang/protobuf@v1.5.3/ptypes/timestamp/timestamp.pb.go:9:2: 
google.golang.org/protobuf@v1.31.0: Get "https://goproxy.io/google.golang.org/protobuf/@v/v1.31.0.zip": 
dial tcp [2606:4700:20::ac43:458a]:443: connect: cannot assign requested address
```

> docker run 如下容器检查是否开启了ipv6

```shell
docker run -it alpine ash -c "ip -6 addr show dev eth0; ip -6 route show"
15: eth0: <BROADCAST,UP,LOWER_UP> mtu 1500
   inet6 2001:db8:1:0:0:242:ac11:3/64 scope global
      valid_lft forever preferred_lft forever
   inet6 fe80::42:acff:fe11:3/64 scope link
      valid_lft forever preferred_lft forever

2001:db8:1::/64 dev eth0  proto kernel  metric 256
fe80::/64 dev eth0  proto kernel  metric 256
default via fe80::1 dev eth0  metric 1024
```

> 尝试开启 https://docs.docker.com/config/daemon/ipv6/

```shell
cat <<EOF> /etc/docker/daemon.json
{
  "ipv6": true,
  "fixed-cidr-v6": "2001:db8:1::/64",
  "experimental": true,
  "ip6tables": true
}
EOF

sudo systemctl restart docker

```

> 再执行检查容器ipv6的结果，发现开启了

```shell
root@gitlab-runner-golang:~# docker run -it alpine ash -c "ip -6 addr show dev eth0; ip -6 route show"
94: eth0@if95: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 state UP 
    inet6 2001:db8:1::242:ac11:2/64 scope global flags 02 
       valid_lft forever preferred_lft forever
    inet6 fe80::42:acff:fe11:2/64 scope link tentative 
       valid_lft forever preferred_lft forever
2001:db8:1::/64 dev eth0  metric 256 
fe80::/64 dev eth0  metric 256 
default via 2001:db8:1::1 dev eth0  metric 1024 
multicast ff00::/8 dev eth0  metric 256 
root@gitlab-runner-golang:~# 

```

> 执行官网的验证

```shell
root@gitlab-runner-golang:~#  docker run --rm -p 80:80 traefik/whoami
Unable to find image 'traefik/whoami:latest' locally

latest: Pulling from traefik/whoami
9a3f489abe7a: Pull complete 
442cc7f997f8: Pull complete 
52416ed98bd1: Pull complete 
Digest: sha256:6956a30c7d33f61bb7fdf1c14dcb3192fca4093cd5b91b5f9b38862862072fe9
Status: Downloaded newer image for traefik/whoami:latest
2024/01/07 08:21:32 Starting up on port 80


root@gitlab-runner-golang:~# curl http://[::1]:80
Hostname: 861a5e787988
IP: 127.0.0.1
IP: ::1
IP: 172.17.0.2
IP: 2001:db8:1::242:ac11:2
IP: fe80::42:acff:fe11:2
RemoteAddr: [2001:db8:1::1]:39176
GET / HTTP/1.1
Host: [::1]
User-Agent: curl/7.81.0
Accept: */*


```

> 构建image镜像过程

```shell
 DOCKER_BUILDKIT=0 docker build -t registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/golang:1.21-cn -f golang121-ubuntu22.Dockerfile .


```

> 自制goproxy代理

- https://github.com/goproxy/goproxy

```shell

docker run --name goproxy --restart=always -d -p 8080:8080 ghcr.io/goproxy/goproxy server --address :8080

go env -w GOPROXY=http://localhost:8080,direct

docker run ghcr.io/goproxy/goproxy server --help

# 分析缓存目录
~ $ ls /goproxy/
caches
~ $ ls /goproxy/caches/
github.com         golang.org         google.golang.org  gopkg.in           k8s.io
~ $ ls /goproxy/caches/
github.com         golang.org         google.golang.org  gopkg.in           k8s.io
~ $


docker run --name goproxy --restart=always -d -p 8080:8080  -v /d/nyy_work/goproxy-cache:/goproxy ghcr.io/goproxy/goproxy server --address :8080


# 需要这样挂，但是不能再git中执行
docker run --name goproxy --restart=always -d -p 8080:8080  -v D:\nyy_work\goproxy-cache:/goproxy/caches ghcr.io/goproxy/goproxy server --address :8080
docker run --name goproxy --restart=always -d -p 7070:8080  -v D:\nyy_work\goproxy-cache:/goproxy/caches ghcr.io/goproxy/goproxy server --address :8080


```

# 关于go项目的检查需要做哪些

> [makeFile](https://eddycjy.gitbook.io/golang/di-3-ke-gin/makefile)

> [govet 静态代码工具](http://shanks.link/blog/2021/04/27/go%E5%B7%A5%E5%85%B7%E4%B9%8Bvet%E9%9D%99%E6%80%81%E8%AF%8A%E6%96%AD%E5%99%A8/)

> [gofmt代码风格](https://cloud.tencent.com/developer/article/2266210)

# 使用gitlab-ci

- https://docs.gitlab.com/ee/ci/

> 简单的样例

- https://docs.gitlab.com/ee/ci/quick_start/index.html

> 复杂的样例

- https://docs.gitlab.com/ee/ci/quick_start/tutorial.html

> 各种各样的样例 ，针对各种语言的

- https://docs.gitlab.com/ee/ci/examples/index.html

> 非常复杂的 样例

- https://gitlab.com/gitlab-org/gitlab/-/blob/master/.gitlab-ci.yml

> 缓存和产物的区别

- 产物是内部产生的
- 缓存是外部下载的
- go项目使用缓存的场景：
    - 多个job里面都需要 go mod tidy
    - 如果没有缓存的话，那么每个步骤都需要重新下载
    - 如果有缓存的话，下载一份

## 关键字

> [image关键字](https://docs.gitlab.com/ee/ci/yaml/#image) 是指定job运行在哪个镜像里面，如果没指定就用runner注册时的，比如我们这里的
> --docker-image alpine:latest

> retry 重试

- 可使用 https://docs.gitlab.com/ee/ci/yaml/#retrywhen 进行特定错误的重试

> stages https://docs.gitlab.com/ee/ci/yaml/#stages

```shell
If stages is not defined in the .gitlab-ci.yml file, the default pipeline stages are:

.pre
build
test
deploy
.post
```

> pipeline & stages & job的关系

- job 单一的任务
- stage是 一组任务的任务组
- 几个任务组 组成 pipeline
- 如果一个stage的job 失败了，那么这个stage的其他job会继续跑完，但是下一个组的不会了

> needs 依赖关系无序运行 https://docs.gitlab.com/ee/ci/yaml/#needs

> 内置的变量 https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

```shell
    echo "全局的after_script 每一个job完成后都要跑 打印变量${DEPLOY_SITE}"
    echo "打印我们可能用到的内置变量 gitLab的ip地址 ${CI_API_V4_URL}"
    echo "打印我们可能用到的内置变量 构建的根目录 ${CI_BUILDS_DIR}"
    echo "打印我们可能用到的内置变量 提交人 ${CI_COMMIT_AUTHOR}"
    echo "打印我们可能用到的内置变量 分支 ${CI_COMMIT_BRANCH}"
    echo "打印我们可能用到的内置变量 tag ${CI_COMMIT_TAG}"
    echo "打印我们可能用到的内置变量 分支或tag ${CI_COMMIT_REF_NAME}"
    echo "打印我们可能用到的内置变量 长id ${CI_COMMIT_SHA}"
    echo "打印我们可能用到的内置变量 段id ${CI_COMMIT_SHORT_SHA}"
    echo "打印我们可能用到的内置变量 时间 ${CI_COMMIT_TIMESTAMP}"
    echo "打印我们可能用到的内置变量 流水线url ${CI_PIPELINE_URL}"
    echo "打印我们可能用到的内置变量 项目名称 ${CI_PROJECT_NAME}"
    echo "打印我们可能用到的内置变量 group名称 ${CI_PROJECT_NAMESPACE}"
```

## golang-ci-lint 静态代码检查 https://juejin.cn/post/7130188153792495630

## gitlab-runner

- 是什么 https://docs.gitlab.com/ee/ci/quick_start/index.html#ensure-you-have-runners-available

> 怎样开启 This GitLab instance does not provide any shared runners yet. Instance administrators can register shared
> runners in the admin area.

- 在admin里面开启 http://192.168.0.91/admin/runners/new

> 分2个步骤，先去安装，安装完了之后再 admin里面去注册

```shell
If you don’t have a runner:

Install GitLab Runner on your local machine.
Register the runner for your project. Choose the shell executor.
```

#### 安装runner https://docs.gitlab.com/runner/install/

> 在ubuntu 机器上 用apt 安装 https://docs.gitlab.com/runner/install/linux-repository.html

```shell
# 添加仓库
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.deb.sh" | sudo bash

# 直接安装 
sudo apt-get install gitlab-runner

# 需要在gitlab runner 页面里面 添加一组 runner的配置，添加完了之后会有 注册token
gitlab-runner register  --url http://192.168.0.91  --token glrt-xiGZa5u5oyyAUixKUzWR

sudo gitlab-runner register \
  --non-interactive \
  --url http://192.168.0.91 \
  --token "glrt-Xv6J4kf-wpxJVy7BqzLv" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --docker-volumes /var/run/docker.sock:/var/run/docker.sock


# 查看配置文件
root@k8s-master01:~# cat /etc/gitlab-runner/config.toml
concurrent = 1
check_interval = 0
shutdown_timeout = 0

[session_server]
  session_timeout = 1800

[[runners]]
  name = "docker-runner"
  url = "http://192.168.0.91"
  id = 1
  token = "glrt-xiGZa5u5oyyAUixKUzWR"
  token_obtained_at = 2024-01-01T12:24:45Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = "docker"
  [runners.cache]
    MaxUploadedArchiveSize = 0
  [runners.docker]
    tls_verify = false
    image = "alpine:latest"
    privileged = false
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ["/cache"]
    shm_size = 0
    network_mtu = 0

#  再添加一个 bash的runner
sudo gitlab-runner register \
  --non-interactive \
  --url http://192.168.0.91 \
  --token "glrt-d64BziCR2bReZ148Dd2x" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner"




```

# 2.3 学习gitlab-auto-devops https://docs.gitlab.com/16.7/ee/topics/autodevops/index.html

# gitlab 安装

> gitlab 和极狐 关系 https://gitlab.cn/why-jh/

- 我们选ce

> 安装方式 https://docs.gitlab.com/ee/install/install_methods.html

- k8s helm 我试了没成功
- 虚拟机 yum apt 包安装  https://docs.gitlab.com/omnibus/installation/
- docker 安装 https://docs.gitlab.com/ee/install/docker.html

## docker安装

- https://help.aliyun.com/zh/ecs/use-cases/deploy-and-use-gitlab
- 为了避免出现问题，开一个新的虚拟机安装gitlab
- 镜像我提前推到 阿里云了 registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/gitlab-ce:v16
- 开新虚拟机，修改ip地址和主机名

```shell
root@k8s-master01:~# vim /etc/netplan/00-installer-config.yaml 
root@k8s-master01:~# netplan apply

```

- 安装docker 千万不要通过snap安装  https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository

```shell 
sudo apt-get update -y 
sudo apt-get install ca-certificates curl gnupg -y 
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y 

 sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y  



```

- 使用docker安装 hostname 改成你机器的ip

```shell
sudo mkdir -p /srv/gitlab
export GITLAB_HOME=/srv/gitlab

sudo docker run --detach \
  --hostname 192.168.0.91 \
  --publish 443:443 \
  --publish 80:80 \
  --publish 5000:22 \
  --name gitlab \
  --restart always \
  --volume $GITLAB_HOME/config:/etc/gitlab \
  --volume $GITLAB_HOME/logs:/var/log/gitlab \
  --volume $GITLAB_HOME/data:/var/opt/gitlab \
  --shm-size 256m \
  registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/gitlab-ce:v16






```

- 等待启动很慢
- 查看密码

```shell
Docker Engine安装方式：sudo docker exec -it gitlab grep 'Password:' /etc/gitlab/initial_root_password

http://192.168.0.91/users/sign_in

```

- 改密码 1111111a
- git-clone的时候 要修改端口

```shell
$ cat ~/.ssh/config
Host 192.168.0.91
        HostName 192.168.0.91
        Port 5000

Administrator@DESKTOP-TPPG8VO MINGW64 /d/nyy_work/go_path/src
$

Administrator@DESKTOP-TPPG8VO MINGW64 /d/nyy_work/go_path/src
$ git clone -v git@192.168.0.91:root/test01.git
Cloning into 'test01'...
The authenticity of host '[192.168.0.91]:5000 ([192.168.0.91]:5000)' can't be established.
ED25519 key fingerprint is SHA256:J4BUCOdh0kEOlw5UyVXlnEHENSAjSB2XkF2szJlWlXo.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '[192.168.0.91]:5000' (ED25519) to the list of known hosts.
remote: Enumerating objects: 3, done.
remote: Counting objects: 100% (3/3), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
Receiving objects: 100% (3/3), done.


```

## cicd 组件选型

> gitlab-ci 流行原因

- cicd从原理上来说 并不复杂
- 用哪个开源组件都可以
- 因为基本代码库用的都是gitlab：gitlab-ci 就做起来的
- 打个比喻：你必须要去一个驿站取快递，同时像买些吃的：驿站就卖吃的就卖的很好
- 公司内部的代码仓库 里面都有个gitlab-ci.yml

| 核心功能       | 组件候选                            | 说明                     |
|------------|---------------------------------|------------------------|
| 代码仓库       | gitlab                          | ce开源版 ，我待过的公司没见过别的代码仓库 |
| 如何构建镜像     | gitlab-runner 、tekton           | 自动打通                   |
| 如何部署到dev集群 | gitlab-ci、tekton、argocd、写个go程序  | 自动打通                   |
| 镜像仓库       | 自建的harbor、docker-register、阿里云仓库 | 存储镜像、pullsecret        |
| 发布工单       | bigdevops 工单模块                  | 审批流，暂停，中止              |
| 生成集群的发布    | bigdevops cicd模块                | 支持stage的发布过程           |
| 灰度发布       | argo-rollout、open-kurise        |                        |

## cicd的流程说明

> ci

- 研发提交代码到 非master分支
- 触发构建至 dev集群：目的是让研发能够有环境 和其他组件进行测试联调
- 合并至master分支：
    - 打tag 跑单元测试
    - 打tag 触发构建镜像

> cd

- 提发布工单
- 工单审批流 通过之后
- 部署：一次就到生产
    - 先部署到预发stage集群：集群维度的灰度：
        - 测试：OK了继续发布工单，测试有问题，终止变更
    - 再生产集群
- 每个集群部署的过程：灰度部署：3个副本不要一下 全部更新

> 关键词 ：看起来是目前必须要实现的功能

- 单测 ？
- 构建镜像
- 部署至 dev测试集群：是不需要工单的：自动一点：快速使用测试环境
- 推送至 镜像仓库
- 发布工单，发布过程
- 灰度发布

## cicd 需求之用户角度

- continuous integration and continuous delivery/continuous deployment CI/CD或CICD通常指的是持续集成和持续交付或持续部署的组合实践。
- https://segmentfault.com/a/1190000040191136
- ![](./pic/img.png)

> 目标 ： 软件的自动、快速、持续交付。
> 使用cicd的人员

- rd通常由开发人员
- qa 测试人员/QA工程师
- ops 运维工程师以及SRE（站点可靠性工程师）


- 编译 打包 构建 测试 发布
- 流水线中推进
- ci 单测 构建 打包
- cd 工单 部署 校验

> 流程说明

- 代码提交至gitlab
- 静态代码检测：提升构建成功率
- 触发构建 打包成二进制
- 构建后的动作
- 触发构建测试： 单测
- 打包镜像：
- 推送至镜像仓库
- 部署的测试
- 持续部署

## 直接部署的反面教材 https://blog.csdn.net/pwk_888/article/details/124611652

![](./pic/img_1.png)

## 流程图调研

![](./pic/img_2.png)
![](./pic/img_3.png)
![](./pic/img_4.png)