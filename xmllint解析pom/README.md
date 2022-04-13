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

# 参考

 [xmllint - Native shell command set to extract node value from XML.html](assets\references\xmllint - Native shell command set to extract node value from XML.html) 

 [maven - xmllint_ xmlns on a non-root xml element.html](assets\references\maven - xmllint_ xmlns on a non-root xml element.html) 



