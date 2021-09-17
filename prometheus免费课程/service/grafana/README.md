# 部署工作
```shell script
# 1. 修改yaml中的节点选择器标签 k8s-node01改为你自己的节点
# 在节点上创建数据目录
mkdir -pv /data/grafana


# 2. 部署grafana
kubectl apply -f grafana_k8s.yaml

# 3. 访问 节点的 :30000端口  账户密码 : admin/admin 
# 4. 添加prometheus数据源，如果prometheus是 hostnetwork的，直接写node的ip:port即可
```
