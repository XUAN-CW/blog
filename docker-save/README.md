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

# 脚本

保存所有镜像

```sh
docker_images=`docker images | awk 'NR>1'`

REPOSITORY_TAG_TAR=`echo "$docker_images" | awk '{print $1"_"$2}' | sed 's/[\x2F]/./g' | awk '{print $1".docker_image.tar"}'`
IMAGE=`echo "$docker_images" | awk '{print $1":"$2}'`
number=`echo "$docker_images" | awk 'END {print NR}'`

for((i=1;i<=$number;i=i+1))
do
    current_REPOSITORY_TAG_TAR=`echo "$REPOSITORY_TAG_TAR" | head -n "$i" | tail -n 1`
    current_IMAGE_ID=`echo "$IMAGE" | head -n "$i" | tail -n 1`
    echo "$i/$number 保存 $current_IMAGE_ID 到 $current_REPOSITORY_TAG_TAR 中..."
    docker save -o $current_REPOSITORY_TAG_TAR $current_IMAGE_ID
done

```

# 交互式

```
#!/bin/bash

echo "What is your favourite OS?"
select var in "Linux" "Gnu Hurd" "Free BSD" "Other"; do
  break;
done
echo "You have selected $var"

```

```


select var in $(docker image ls | awk 'NR>1 {print $1 $2 }'); do
  break;
done
echo "You have selected $var"

```

