nginxroot=/c/cache/software-for-development
find $pwd -type f | xargs readlink -f | sed "s/.\{${#nginxroot}\}\(.\{1,\}\)/wget http:\/\/localcache\1/"  > localcache.info
