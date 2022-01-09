---
title: docker-save
tags: 
- docker
- save
- 离线
date: 2021-12-30 02:56:53
id: 1640804213979022300
---
# 概述

#  [save](https://docs.docker.com/engine/reference/commandline/save/) 

```sh
 docker save -o mysql.tar mysql:latest
```

#  [load](https://docs.docker.com/engine/reference/commandline/load/) 

```sh
docker load -i mysql.tar
```

## 批量导入

```sh
ls *docker_image* |sed -r 's#(.*)#docker load -i \1#' | bash
```

# docker-save 脚本

```sh
sudo vi /usr/local/bin/docker-save
```

```sh
old_IFS=$IFS # 保存原来的 Internal Field Seprator 
IFS=$'\n' # Internal Field Seprator 换成换行

select var in $(docker images --format "{{.ID}} {{.Repository}} {{.Tag}}" | sort -k 2); do
  IFS=$old_IFS # 恢复 Internal Field Seprator 
  if [ "" != "$var" ];then
    # output 需要替换掉特殊字符，这里替换掉了斜杠
    output=$(echo ${var} | awk '{print $2"["$3"].docker_image.tar"}' | sed 's/[\x2F]/./g')
    IMAGE=$(echo ${var} | awk '{print $2":"$3}')
    
    echo "保存 $IMAGE 到 $output 中..."
    docker save -o $output $IMAGE
    echo "保存完毕"
  else
    echo "please select a valid option"
  fi 
done
```









