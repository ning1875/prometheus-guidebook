



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


```yaml
apiVersion: cicdoperator.ning1875.io/v1
kind: MyTask
metadata:
  name: t2
spec:
  params:
    - name: IMAGE_BASE_PATH
      description: base path image to build.
    - name: GIT_REVISION
      description: The branch, tag or SHA to checkout.
      default: ""
      hasDefault: true

  results:

    - name: IMAGE_URL
      description: URL of the image just built.
  steps:
    - name: genarate-image-tag
      image: docker.io/library/bash:5.1.4@sha256:b208215a4655538be652b2769d82e576bc4d0a2bb132144c060efc5be8c3f5d6
      #image: busybox
      script: |-

        image_base_path=$(params.IMAGE_BASE_PATH)
        git_revision=$(params.GIT_REVISION)
        git_tag=""
        case ${git_revision} in
        "")
        git_tag="master"
        ;;
        *)
        git_tag="${git_revision}"
        ;;
        esac
        echo "git_tag ${git_tag}"
        random_str=$(date +%s%N | md5sum |cut -c 1-9)
        echo "random_str ${random_str}"
        date_str=$(date +"%Y%m%d-%H-%M")
        echo -n "${image_base_path}:${git_tag}-${date_str}-${random_str}" | tee "$(results.IMAGE_URL)"
        sleep 20
    - name: hello-world
      image: docker.io/library/bash:5.1.4@sha256:b208215a4655538be652b2769d82e576bc4d0a2bb132144c060efc5be8c3f5d6
      script: |-

        echo hello-world
        sleep 60
---
apiVersion: cicdoperator.ning1875.io/v1
kind: MyTaskRun

metadata:
  name: tr2
spec:
  taskRef: t2
  params:
    - name: IMAGE_BASE_PATH
      value: registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/mytask-01


  workspaces:
    - name: myworkspace
      emptyDir: {}

```



# pipeline
```shell
extensions                                 ext,exts              dashboard.tekton.dev/v1alpha1          true         Extension
clustertasks                                                     tekton.dev/v1beta1                     false        ClusterTask
conditions                                                       tekton.dev/v1alpha1                    true         Condition
pipelineresources                                                tekton.dev/v1alpha1                    true         PipelineResource
pipelineruns                               pr,prs                tekton.dev/v1beta1                     true         PipelineRun
pipelines                                                        tekton.dev/v1beta1                     true         Pipeline
runs                                                             tekton.dev/v1alpha1                    true         Run
taskruns                                   tr,trs                tekton.dev/v1beta1                     true         TaskRun
tasks                                                            tekton.dev/v1beta1                     true         Task

```

## mytaskrun
```yaml
apiVersion: cicdoperator.ning1875.io/v1
kind: MyTask
metadata:
  name: t1
spec:
  params:
    - name: IMAGE_BASE_PATH
      description: base path image to build.
    - name: GIT_REVISION
      description: The branch, tag or SHA to checkout.
      default: ""
      hasDefault: true

  results:

    - name: IMAGE_URL
      description: URL of the image just built.
  steps:
    - name: genarate-image-tag
      image: docker.io/library/bash:5.1.4@sha256:b208215a4655538be652b2769d82e576bc4d0a2bb132144c060efc5be8c3f5d6
      script: |

        image_base_path=$(params.IMAGE_BASE_PATH)
        git_revision=$(params.GIT_REVISION)
        git_tag=""
        case ${git_revision} in
        "")
        git_tag="master"
        ;;
        *)
        git_tag="${git_revision}"
        ;;
        esac
        echo "git_tag ${git_tag}"
        random_str=$(date +%s%N | md5sum |cut -c 1-9)
        echo "random_str ${random_str}"
        date_str=$(date +"%Y%m%d-%H-%M")
        echo -n "${image_base_path}:${git_tag}-${date_str}-${random_str}" | tee "$(results.IMAGE_URL.path)"

---
apiVersion: cicdoperator.ning1875.io/v1
kind: MyTaskRun

metadata:
  name: tr1
spec:
  taskRef: t1
  params:
    - name: IMAGE_BASE_PATH
      value: registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/mytask-01


  workspaces:
    - name: myworkspace 
      emptyDir: {}

```

## 最简核心模型
- 按顺序执行 pod init containers
- 接受输入 input
- 产生输出 output result 

## crd抽象
- task 是模板，taskrun执行
- pipeline是模板 ，pipelinerun 执行


## taskResult 的生成和共享
- 生成是写入 pod的terminationMsg 字段
- 由entrypoint D:\go_path\src\github.com\tektoncd\pipeline\pkg\entrypoint\entrypointer.go ？
- 写入taskRun 的taskResult 就可以实现多个taskRun直接 也就是多个pod之间的共享
- script pod是解析taskRun 中的script 字段生成bash文件
- 注入脚本，实现pod 不能识别的taskRun操作
- initContainer 注入 entrypoint二进制
- 封装cmd 命令，将result写入 containerStatuses.terminated.message中，然后由taskRun调谐 读取写入taskRun的result 中供其他taskRun获取 


## 最基础的单位 task
- task由一组step组成 ，对应是pod，由下面几部构成
  - Parameters 参数
  - Resources 资源
  - Steps 步骤
  - Workspaces 资源
  - Results 结果
- step 对应就是按顺序执行的initContainers 


```yaml
apiVersion: logoperator.ning1875.io/v1
kind: CollectRule
metadata:
  name: cr-01
spec:
  logBackend: lb-1
  targetNamespace: default # 过滤namespace
  selector:
    app: gin-web-log # 过滤pod
  collectPattern: ".*xiaoyi.*"   # 过滤日志的正则
  logAlert:
    url: https://oapi.dingtalk.com/robot/send?access_token=75f08bf6f2fa40d45bc987608fa3ffa860bc9d8e2cd2b6099a5cc644ba0b3c50
    keyWordPattern: ".*400.*"
    atMobiles:
      - "15810947075"
```

```shell
kubebuilder create api --group logoperator --version v1 --kind CollectRule
kubebuilder create webhook --group logoperator --version v1 --kind CollectRule --defaulting --programmatic-validation




make docker-build docker-push IMG=registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
make deploy IMG=registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0

```
- make push 
```shell
make docker-build docker-push IMG=registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
/root/nyy/operator/logoperator/bin/controller-gen rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases
/root/nyy/operator/logoperator/bin/controller-gen object:headerFile="hack/boilerplate.go.txt" paths="./..."
go fmt ./...
go vet ./...
KUBEBUILDER_ASSETS="/root/.local/share/kubebuilder-envtest/k8s/1.23.5-linux-amd64" go test ./... -coverprofile cover.out
?       ning1875.io/logoperator [no test files]
ok      ning1875.io/logoperator/api/v1  5.142s  coverage: 2.6% of statements
ok      ning1875.io/logoperator/controllers     5.365s  coverage: 1.5% of statements
docker build -t registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0 .
Sending build context to Docker daemon  481.3kB
Step 1/14 : FROM golang:1.17 as builder
 ---> e7fdd0b10edc
Step 2/14 : WORKDIR /workspace
 ---> Using cache
 ---> 24e599dd46ab
Step 3/14 : COPY go.mod go.mod
 ---> Using cache
 ---> 8e6469a47437
Step 4/14 : COPY go.sum go.sum
 ---> Using cache
 ---> 6a256297b0f8
Step 5/14 : RUN go mod download
 ---> Using cache
 ---> 912156b6906e
Step 6/14 : COPY main.go main.go
 ---> Using cache
 ---> 5c0160f0c196
Step 7/14 : COPY api/ api/
 ---> Using cache
 ---> 3ef89a229afd
Step 8/14 : COPY controllers/ controllers/
 ---> Using cache
 ---> fddcf49168b7
Step 9/14 : RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o manager main.go
 ---> Using cache
 ---> cc3c7c4ec700
Step 10/14 : FROM gcr.io/distroless/static:nonroot
 ---> bbd57f9cdb20
Step 11/14 : WORKDIR /
 ---> Using cache
 ---> 249c33127e87
Step 12/14 : COPY --from=builder /workspace/manager .
 ---> Using cache
 ---> f84159fa0707
Step 13/14 : USER 65532:65532
 ---> Using cache
 ---> 0b6a65c75a01
Step 14/14 : ENTRYPOINT ["/manager"]
 ---> Using cache
 ---> d5b9199c4966
Successfully built d5b9199c4966
Successfully tagged registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
docker push registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
The push refers to repository [registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller]
7fd1bf36a1cd: Pushed
0b031aac6569: Pushed


v1.0: digest: sha256:a0727d3ea4a274f3b93961c183d324176911f21e1332d15fb5679260285719f8 size: 739

```

- make deploy
```shell
make deploy IMG=registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
/root/nyy/operator/logoperator/bin/controller-gen rbac:roleName=manager-role crd webhook paths="./..." output:crd:artifacts:config=config/crd/bases

cd config/manager && /root/nyy/operator/logoperator/bin/kustomize edit set image controller=registry.cn-beijing.aliyuncs.com/ning1875_haiwai_image/logoperator-controller:v1.0
/root/nyy/operator/logoperator/bin/kustomize build config/default | kubectl apply -f -
namespace/logoperator-system created
customresourcedefinition.apiextensions.k8s.io/collectrules.logoperator.ning1875.io configured
customresourcedefinition.apiextensions.k8s.io/logbackends.logoperator.ning1875.io configured
serviceaccount/logoperator-controller-manager created
role.rbac.authorization.k8s.io/logoperator-leader-election-role created
clusterrole.rbac.authorization.k8s.io/logoperator-manager-role created
clusterrole.rbac.authorization.k8s.io/logoperator-metrics-reader created
clusterrole.rbac.authorization.k8s.io/logoperator-proxy-role created
rolebinding.rbac.authorization.k8s.io/logoperator-leader-election-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/logoperator-manager-rolebinding created
clusterrolebinding.rbac.authorization.k8s.io/logoperator-proxy-rolebinding created
configmap/logoperator-manager-config created
service/logoperator-controller-manager-metrics-service created
deployment.apps/logoperator-controller-manager created

```


- panic 
```shell
 kubectl logs logoperator-controller-manager-6bc8b8f48-lb8ts -n logoperator-system -c manager
path not exists need create ./logbackend_dir
panic: Error creating directory

goroutine 1 [running]:
main.main()
        /workspace/main.go:75 +0xb66

```

### 讲解日志采集优劣
- 采集分析 https://www.kubernetes.org.cn/6935.html





### 架构图
- 架构图![image](https://camo.githubusercontent.com/1826e4f1b9b8107d7e7480137c767cbb9ef9689746bad30d8b0ce7ceef75b6d0/68747470733a2f2f62616e7a6169636c6f75642e636f6d2f646f63732f6f6e652d6579652f6c6f6767696e672d6f70657261746f722f696d672f6c6f6767696e675f6f70657261746f725f666c6f772e706e67)
- 日志流程图 ![image](https://camo.githubusercontent.com/05a759c6120d6f5965c0d7eeedb969d0ec3e0a252703ba60a3348eab424838bd/68747470733a2f2f62616e7a6169636c6f75642e636f6d2f646f63732f6f6e652d6579652f6c6f6767696e672d6f70657261746f722f696d672f6c6f6767696e672d6f70657261746f722d76322d6172636869746563747572652e706e67)



### 核心CRD对象
- logging - 表示采集器。包括Fluentd和Fluent-bit配置。指定controlNamespace. Fluentd 和 Fluent-bit 将部署在controlNamespace
- output - 指定打向特定数据源，可以根据正则过滤日志
- flow - 正则过滤，标签匹配ns和pod

- 采用直接和kubelet交互
```shell script
kubectl logs : GET

/containerLogs/{namespace}/{pod}/{container}

kubectl logs –tails=2 : GET

/containerLogs/{namespace}/{pod}/{container}?tailLines=2

kubectl logs -f : GET

/containerLogs/{namespace}/{pod}/{container}?follow=true
```