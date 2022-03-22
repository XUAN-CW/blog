---
title: docker可视化
tags: 
date: 2022-03-22 13:24:05
id: 1647926646014275400
---
# 摘要







```
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.11.1
```





访问 https://localhost:9443



# 参考

https://docs.portainer.io/v/ce-2.11/start/install/server/docker/linux 
