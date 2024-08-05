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
