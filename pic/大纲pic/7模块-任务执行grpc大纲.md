



#  <font color=blue> 大运维平台5大模块</font>
- 01 资产管理 & cmdb & 服务树
- 02 工单 & 工作流 & 审批
- 03 cicd 全流程配置
- 04 Prometheus管理配置
- 05 k8s多集群管理

##  <font color=red>00 为什么是这5个模块</font>
- k8s/prometheus/cicd作为当下3大运维开发主流方向，这点大家都知道
- 但是如果只做上面3个模块还少了些基础的模块
- 这里的基础模块说的就是 cmdb和工单
- cmdb很好理解：
    - 监控/cicd/k8s等内部很多资源都属于资源
    - 资源就需要有管理的地方
    - 同时资产和服务的绑定形式应该是一颗服务树
    - 在服务树的节点上可以配置权限和绑定其他模块资源
        - 比如给 data.system.dns 绑定cicd发布模板可以发布dns配置
        - 比如给 infra.sre.apolloy绑定监控告警配置项
- 那么为什么还需要工单呢，主要原因有下面2点
    - 01 因为我们很多的操作需要工单审批之后才做
        - 比如 在页面上通过yaml编辑器编辑 k8s的deployment 会触发变更
        - 此时应该触发生成一张工单：经过预设的审批人审批后 再执行
    - 02 还有一些我们通用的运维工作需要工单支持
        - 比如调整安全组
        - 比如申请consul 服务发现token

## 树层级 总结服务树前端功能
- 每个树层级操作

    - 展开和折叠:
        - 默认只展开第一层
        - 每次点击下一层的展开按钮再展开 ：infra.k8s.prod-01.node.k8s-node-prod-01
    - 这个树节点内容：获取这个节点的机器列表

- 加载方式
    - 懒加载 异步  D:\nyy_work\fe-work\a-ben-yuan\src\views\demo\tree\index.vue
        - 数据不是一次请求完成
        - 而且根据父级再去查询子集
- 数据操作 ：右键菜单 beforeRightClick
    - 在父层级添加子集
    - 删除
- 工具栏使用 toolbar
- 函数操作按钮 D:\nyy_work\fe-work\a-ben-yuan\src\views\demo\tree\ActionTree.vue
- isLeaf 叶子节点：不能再有孩子了
- showLine 节点连线

## 服务树
- 服务树节点操作
    - 增加：右键添加
        - 父层级添加子层级
        - 节点属性：
            - 名称        name
            - 是否是子节点 isLeaf
            - 第几层级：  0,1,2,3
            - 父节点id：  parentId
            - 图标：      icon ：选择列表，而不是五花八门的
    - 删除：右键删除
        - 是否级联删除
        - 删除保护：如果子节点还有，那么不让删除父节点
    - 更新：根据id操作
        - 名称是可以更新的
    - 挪动节点？ 是否要做 ：也可以通过先删除后添加
- 树展示：查询
    - 一层一层的加载：默认全部展开是没有意义的
    - 数据是否异步：
        - 服务树特别庞大：全部数据前端渲染比较卡
        - 根据父层级查子层级：向下一层查询
        - 根据父层级展开所有层级：
- 不太想拼接 id形式 0-1-3-4

【4】grpc任务执行 第1章 任务执行中心和agent基本运维经验
【4】grpc任务执行 第2章 grpc-server和client代码
【4】grpc任务执行 第3章 agent信息采集上报
【4】grpc任务执行 第4章 设计任务执行中心和agent本地执行
【4】grpc任务执行 第5章 agent-linux测试
【4】grpc任务执行 第6章 agent多task本地manager
【4】grpc任务执行 第7章 server端任务几张数据表和调度逻辑
【4】grpc任务执行 第8章 任务执行错误策略-任务暂停-任务并发
【4】grpc任务执行 第9章 任务执行的前端页面
【4】grpc任务执行 第10章 发现重大bug
【4】grpc任务执行 第11章 任务执行的脚本管理和任务模板
【4】grpc任务执行 第12章 新增任务的模板中的机器选择
【4】grpc任务执行 第13章 任务动作逻辑
【4】grpc任务执行 第14章 单机任务结果查询
【4】grpc任务执行 第15章 收尾


# grpc-agent和任务执行中心大纲
- 第1章 任务执行中心和agent基本运维经验
  - 1.1 任务执行和agent
  - 1.2 调研任务执行中心平台
  - 1.3 grpc的基础知识
  - 1.4 准备环境安装依赖包 
  - 1.5 gen-go和gen-grpc插件 
  - 1.6 学习grpc-go样例
  - 1.7 从proto文件生成go和grpc代码
  - 1.8 json-rpc的好处和grpc-gorm共享结构问题
  - 1.9 准备pb目录和pb文件了

- 第2章 grpc-server和client代码
  - 2.1 agent基础代码
  - 2.2 agent日志添加主机名和ip地址的标识
  - 2.3 grpc 连接池调研
  - 2.4 使用连接池初始化agent
  - 2.5 封装cronManger共享grpcClient
  - 2.6 编译测试agent
  - 2.7 准备server端的grpc代码
  - 2.8 各个manager添加开关
  - 2.9 测试grpc-call

- 第3章 agent信息采集上报
  - 3.1 思考核心功能定义上报字段
  - 3.2 agent如何采集
  - 3.3 agent信息上报字段
  - 3.4 grpc-server处理sn逻辑
  - 3.5 检查实例是否为新增的
  - 3.6 模拟disk触发genHash的增量更新
  - 3.7 公有云同步模块排除agent上报记录

- 第4章 设计任务执行中心和agent本地执行
  - 4.1 架构设计
  - 4.2 go-exec基础样例
  - 4.3 agent本地执行依赖项目
  - 4.4 prepare做task执行前准备
  - 4.5 exec超时时间ctx的问题
  - 4.6 kill进程组实现超时kill
  - 4.7 拼接start的外层
  - 4.8 wait设置任务状态
  - 4.9 任务结果落盘保存
  - 4.10 处理用户的参数
  
- 第5章 agent-linux测试
  - 5.1 准备编译脚本放到linux上执行
  - 5.2 解决刚开始就被kill的问题
  - 5.3 进行多种情况的测试
  - 5.4 bash-c传参问题
  - 5.5 长任务不kill和win编译折中方案
  - 5.6 非root用户执行测试
  - 5.7 测试python脚本能否被kill
  - 5.8 任务中支持python
  - 5.9 python脚本位置空格问题
  - 5.10 无论python还是shell脚本中指定解析器
  - 5.11 其他用户尝试python脚本

- 第6章 agent多task本地manager
  - 6.1 准备manager基础结构
  - 6.2 定义grpc下发任务和结果的字段
  - 6.3 grpc上报结果的请求
  - 6.4 本地收集结果的逻辑
  - 6.5 grpc结果分配新任务
  - 6.6 如何确保下发和上报一定成功
  - 6.7 server端任务grpc基础逻辑
  - 6.8 server和agent的grpc联调
  - 6.9 本地磁盘中是否存在
  - 6.10 client中的too_many_pings问题
  - 6.11 kill-task的问题
  - 6.12 agent挂掉了重启接管存量的任务

- 第7章 server端任务几张数据表和调度逻辑
  - 7.1 思考都需要哪些表
  - 7.2 脚本表和任务元信息
  - 7.3 任务结果表
  - 7.4 mock几个task数据
  - 7.5 定义任务元信息本地cache
  - 7.6 定时刷新这个map-01
  - 7.7 计算task中未调度的机器
  - 7.8 grpc下发任务时初始化结果记录
  - 7.9 联调测试观察突变
  - 7.10 grpc更新任务结果

- 第8章 任务执行错误策略-任务暂停-任务并发
  - 8.1 任务并发的逻辑
  - 8.2 任务并发的测试
  - 8.3 解决并发下发顺序随机问题
  - 8.4 任务暂停和继续
  - 8.5 任务执行错误策略 -- 在grpc中 遇到单个机器错误设置？
  - 8.6 OnErrorStrategy的逻辑 
  - 8.7 grpc触发cache-renew 
  - 8.8 测试任务执行错误

- 第9章 任务执行的前端页面
  - 9.1 后端拆分menu等基础数据并新建脚本管理菜单
  - 9.2 脚本模板查询列表
  - 9.3 调研脚本shell和python编辑器
  - 9.4 安装的问题
  - 9.5 再次安装

- 第10章 发现重大bug
   - 10.1 诉说并复现这个起因
   - 10.2 全局引入antd组件问题
   - 10.3 vben安装外部依赖包
   - 10.4 切换语言的高亮
   - 10.5 梳理一下代码编辑器的需求
   - 10.6 参考样例实现的问题
   - 10.7 实现这个编辑器的准备工作
   - 10.8 解读样例代码
   - 10.9 实现shell和python编辑器
   - 10.10 json和yaml

- 第11章 任务执行的脚本管理和任务模板
  - 11.1 脚本管理基础列表
  - 11.2 拆分codemirror尝试1
  - 11.3 拆分codemirror尝试2
  - 11.4 合并code到drawer里面
  - 11.5 后端接口实现
  - 11.6 任务管理的表格
  - 11.7 新增和编辑任务的form
  - 11.8 按钮控制表格和form
  - 11.9 后端mock表按模块拆分
  - 11.10 任务详情展示脚本并添加编辑

- 第12章 新增任务的模板中的机器选择
  - 12.1 选择脚本联动显示code
  - 12.2 完成select逻辑
  - 12.3 机器选择的逻辑
  - 12.4 尝试树节点选择tree
  - 12.5 不考虑权限的树节点选择
  - 12.6 选择树节点后拉取机器
  - 12.7 mock中去给13号节点绑定机器
  - 12.8 选择树节点后拉取机器
  - 12.9 解决穿梭框的问题并拼接数据
  - 12.10 创建任务的后端代码
  - 12.11 hostIpRaw的逻辑

- 第13章 任务动作逻辑
  - 13.1 detail菜单和跳转
  - 13.2 detail逻辑01
  - 13.3 detail逻辑02
  - 13.4 时间轴进度追踪
  - 13.5 任务的动作按钮和后端逻辑
  - 13.6 每次任务动作完成后更新时间轴
  - 13.7 任务按钮根据状态变化

- 第14章 单机任务结果查询
  - 14.1 单机任务结果查询列表
  - 14.2 根据jobId查询结果
  - 14.3 分页支持和为开始机器填充数据
  - 14.4 第一轮验证完整的流程：真实机器 下发执行 看结果
  - 14.5 修复机器结果表格高度 agent本地目录问题
  - 14.6 状态过滤和ip模糊查询
  - 14.7 测试kill发现下发问题
  - 14.8 添加killing中间状态
  - 14.9 stdout和stderr展示
  - 14.10 完整的测试添加finished状态管理
  - 14.11 模块04-grpc-agent和任务执行中心演示01
  - 14.12 结束任务没有更新进度条

- 第15章 收尾
  - 15.1 formDesign引用codemirror包问题
  - 15.2 解决多个版本codemirror包问题
  - 15.3 留几个作业给你们



    "codemirror5": "^5.65.12",
pnpm add codemirror5@npm:codemirror@5.65.12  --ignore-workspace-root-check




pnpm add codemirror6@npm:codemirror@6.0.1  --ignore-workspace-root-check


pnpm add codemirror-editor-vue3 codemirror@5.x @types/codemirror --ignore-workspace-root-check

pnpm add codemirror6/lang-javascript@npm:codemirror/lang-javascript@6.2.1  --ignore-workspace-root-check


@codemirror/lang-javascript": "^6.2.1",



npm install codemirror vue-codemirror --save


pnpm add codemirror vue-codemirror \
   @codemirror/lang-html \
   @codemirror/lang-python  \
   @codemirror/theme-one-dark \
   @codemirror/lang-javascript \
   @codemirror/language \
   @codemirror/legacy-modes  --ignore-workspace-root-check



pnpm add @codemirror/lang-python --ignore-workspace-root-check


# 存量 grpc-agent 信息上报：命令执行中心
- 基于服务树和机器可以做 批量任务执行功能
- 权限：在树节点上选择：是运维负责人即可

# 任务执行中心


