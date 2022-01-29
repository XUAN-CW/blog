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

# 原理

1. [save](https://docs.docker.com/engine/reference/commandline/save/) 
2. [load](https://docs.docker.com/engine/reference/commandline/load/) 

# 自定义脚本

## 批量导入

```sh
ls *docker_image* | sed -r "s#(.*)#docker load -i \1#" | bash
```

我们给存为脚本：

```sh
echo 'ls *docker_image* | sed -r "s#(.*)#docker load -i \1#" | bash' > /usr/local/bin/docker-load
sudo chmod 777 -R /usr/local/bin/
```

## docker-save 脚本

```sh
touch /usr/local/bin/docker-save
chmod 777 /usr/local/bin/docker-save
vi /usr/local/bin/docker-save

```

```sh
old_IFS=$IFS # 保存原来的 Internal Field Seprator 
IFS=$'\n' # Internal Field Seprator 换成换行
# IFS=$old_IFS # 恢复 Internal Field Seprator 

IMAGES=$(docker images --format "{{.ID}} {{.Repository}} {{.Tag}}" | sort -k 2)

SELECT_ALL_IMAGE="ALL_IMAGE"
select var in ${IMAGES}${IFS}${SELECT_ALL_IMAGE}; do
  if [ "" != "$var" ];then
    if [ "$var" == "$SELECT_ALL_IMAGE" ];then
      SHOULD_BE_SAVE_IMAGE="$IMAGES"
    else 
      SHOULD_BE_SAVE_IMAGE=$(echo "$IMAGES" | grep "${var}")
    fi
    
    for IMAGE in $SHOULD_BE_SAVE_IMAGE
    do
      # output 需要替换掉特殊字符，这里替换掉了斜杠
      output=$(echo ${IMAGE} | awk '{print $2"_"$3".docker_image.tar"}' | sed 's/[\x2F]/./g')
      IMAGE_NAME=$(echo ${IMAGE} | awk '{print $2":"$3}')
      echo "保存镜像 ID 为 $IMAGE_NAME 的镜像到 $output 中..."
      docker save -o $output $IMAGE_NAME
    done
    echo "保存完毕"
  else
    echo "please select a valid option"
  fi
done
```









