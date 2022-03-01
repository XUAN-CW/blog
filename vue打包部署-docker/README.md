---
title: vue打包部署-docker
tags: 
- docker
- vue
- 打包
- 发布
- nginx
date: 2021-12-30 02:16:42
id: 1640801802082817100
---
# 概述



# 环境准备

## 虚拟机

- Ubuntu 18.04.5 LTS

## docker

- Docker version 20.10.12, build e91ed57

# 实现步骤

## 创建项目并打包 - 方法一

### 环境准备：nodejs

虚拟机安装 nodejs 

```sh
# 下载
curl https://nodejs.org/dist/v16.13.1/node-v16.13.1-linux-x64.tar.xz -O
# 解压
tar xf node-v16.13.1-linux-x64.tar.xz -C /usr/local/
# 创建软连接，使其全局可用
ln -s /usr/local/node-v16.13.1-linux-x64/bin/node /usr/local/bin
ln -s /usr/local/node-v16.13.1-linux-x64/bin/npm /usr/local/bin
```

### 环境准备：vue

虚拟机安装 vue

```sh
npm install vue@next
npm install -g @vue/cli --registry=https://registry.npm.taobao.org
# 创建软连接，使其全局可用
ln -s /usr/local/node-v16.13.1-linux-x64/bin/vue /usr/local/bin
```

### 创建项目

```sh
# 执行后一路回车即可
vue create deploy-vue-by-docker
```

创建项目后记得先测试一下看看能不能用，如果不行，下面的也别做了

### build

```sh
# 进入项目
cd deploy-vue-by-docker
# 项目打包
npm run build
```



## 创建项目并打包 - 方法二

### 创建镜像

在项目下创建 Dokerfile ：

```dockerfile
FROM node:16.14.0-bullseye
RUN npm install -g @vue/cli@@vue/cli 5.0.1 --registry=https://registry.npm.taobao.org
```

```sh
docker build -t create-vue-project:1.0 .
```

### 创建 vue 项目

```sh
docker run -it --rm \
  --name deploy-vue-by-docker \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  create-vue-project:1.0 \
  vue create deploy-vue-by-docker
  
cd deploy-vue-by-docker

docker run -it --rm \
  --name deploy-vue-by-docker \
  -v "$PWD":/usr/src/app \
  -w /usr/src/app \
  create-vue-project:1.0 \
  npm run build
```

## 部署

### Dokerfile

在 deploy-vue-by-docker 项目下创建 Dokerfile ：

```dockerfile
FROM nginx:1.19.3-alpine
COPY dist/ /usr/share/nginx/html/
```

### docker build

```sh
docker build -t deploy-vue-by-docker:1.0 .
```

### docker run

```sh
docker run --name deploy-vue-by-docker -p 80:80 -d deploy-vue-by-docker:1.0
```









