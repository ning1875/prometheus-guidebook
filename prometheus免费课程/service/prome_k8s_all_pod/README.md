# 部署工作
```shell script
# 1.监控etcd需要创建 secret
kubectl create secret generic etcd-certs --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.crt --from-file=/etc/kubernetes/pki/etcd/healthcheck-client.key --from-file=/etc/kubernetes/pki/etcd/ca.crt -n kube-system

# 2. 修改pv.yaml中的节点选择器标签 k8s-node01改为你自己的节点
# 在节点上创建数据目录
mkdir -pv /data/prometheus


# 3. 部署kube-stats-metrics
kubectl apply -f kube-stats-metrics

# 4. 部署prometheus服务
kubectl apply -f prome_k8s_all_pod/

# 5. 使用node的ip:8091即可访问服务
```

