---
title: xmllint解析pom
tags: 
date: 2022-04-13 13:14:50
id: 1649826890498610200
---
# 摘要



```sh
echo "cat //*[local-name()='project']/*[local-name()='version']" | xmllint --shell pom.xml | sed '/^\/ >/d' | sed 's/<[^>]*.//g'
```

