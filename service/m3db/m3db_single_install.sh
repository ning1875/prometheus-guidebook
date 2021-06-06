#!/bin/bash


systemctl stop m3dbnode
# 慎重哦
rm -rf /opt/app/m3db
# 创建目录
mkdir -p /opt/app/m3db/data/{m3db,m3kv}
# 拷贝文件
/bin/cp -f  m3dbnode /opt/app/m3db/m3dbnode
/bin/cp -f  m3dbnode_single.yaml /opt/app/m3db/m3dbnode_single.yaml
# 设置内核参数
sysctl -w vm.max_map_count=3000000
sysctl -w vm.swappiness=1
sysctl -w fs.file-max=3000000
sysctl -w fs.nr_open=3000000
ulimit -n 3000000

grep 'vm.max_map_count = 3000000' /etc/sysctl.conf || cat >> /etc/sysctl.conf <<'EOF'
# m3db
vm.max_map_count = 3000000
vm.swappiness = 1
fs.file-max = 3000000
fs.nr_open = 3000000
EOF

# 复制service文件
sudo /bin/cp -f -a m3dbnode.service /etc/systemd/system/m3dbnode.service
systemctl daemon-reload
systemctl start m3dbnode
systemctl status m3dbnode


# 创建namespace和placement
curl -X POST http://localhost:7201/api/v1/database/create -d '{
  "type": "local",
  "namespaceName": "default",
  "retentionTime": "48h",
  "numShards": "8"
}'

# 查看初始化状态
curl http://localhost:7201/api/v1/services/m3db/placement  |python -m json.tool
# ready一下

#!/bin/bash
curl -X POST http://localhost:7201/api/v1/services/m3db/namespace/ready -d '{
  "name": "default"
}'

# 写入测试数据
#!/bin/bash
curl -X POST http://localhost:7201/api/v1/json/write -d '{
  "tags":
    {
      "__name__": "third_avenue",
      "city": "new_york",
      "checkout": "1"
    },
    "timestamp": '\"$(date "+%s")\"',
    "value": 3347.26
}'
# 查询测试数据

curl -X "POST" -G "http://localhost:7201/api/v1/query_range" \
  -d "query=third_avenue" \
  -d "start=$(date "+%s" -d "45 seconds ago")" \
  -d "end=$( date +%s )" \
  -d "step=5s"