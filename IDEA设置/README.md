---
title: IDEA设置
tags: 
- IDEA
- 设置
date: 2021-12-28 20:56:46
id: 1640696206808145800
---




# 字体设置

![image-20200402230127351](assets/image/image-20200402230127351.png)

# 编码设置

![image-20200402080220166](assets/image/image-20200402080220166.png)

# 控制台字体设置

![image-20200402230442055](assets/image/image-20200402230442055.png)

# 模板设置

![image-20200404111811705](assets/image/image-20200404111811705.png)

# 自动导包

![image-20200901002659725](assets/image/image-20200901002659725.png)

# 多行显示tabs

![image-20200901003150681](assets/image/image-20200901003150681.png)

# 注释颜色

```
20894D
```

![image-20200901004232861](assets/image/image-20200901004232861.png)

```
15559A
```

![image-20200901004340952](assets/image/image-20200901004340952.png)

# 头部信息

```java
/** 
@author 禤成伟
@since ${YEAR}-${MONTH}-${DAY} ${TIME}
*/
```

![image-20200901005112766](assets/image/image-20200901005112766.png)

# 统一设置为 UTF-8

![image-20200901005441397](assets/image/image-20200901005441397.png)

# 自动编译

![image-20200901005732931](assets/image/image-20200901005732931.png)



# 方法注释

## 参考

 [idea设置方法注释](assets\references\idea设置方法注释.html) 

## 三个重要参数

```
* 
 * 
 $param$
 return
 */
```

```
groovyScript("if(\"${_1}\".length() == 2) {return '';} else {def result=''; def params=\"${_1}\".replaceAll('[\\\\[|\\\\]|\\\\s]', '').split(',').toList();for(i = 0; i < params.size(); i++) {if(i==0){result+='* @param ' + params[i]}else{result+='\\n' + ' * @param ' + params[i]}}; return result;}", methodParameters());
```

```
groovyScript("def returnType = \"${_1}\"; def result = '* @return ' + returnType; return result;", methodReturnType());
```

![image-20210628232904876](assets/image/image-20210628232904876.png)

## 作用范围

![image-20210904010308973](assets/image/image-20210904010308973.png)

# 设置 project 显示

![image-20210904015522361](assets/image/image-20210904015522361.png)

# terminal

![image-20210904020707615](assets/image/image-20210904020707615.png)



# Idea使用系统应用打开md文件

我想双击用本地应用打开 markdown 文件，但网上的怎么找都找不到。

我在 idea 中双击 mp4 文件，他就直接本地应用播放了，所以就在想，能让 MP4 直接本地应用打开，那应该也可以让能让 md 直接本地应用打开。于是我直接从 IDEA 导出  **settings.zip**，解压后检索 `mp4` ,于是在   [settings\options\filetypes.xml](assets\data\filetypes.xml) 中找到了  `mp4`  ：

```xml
<application>
  <component name="FileTypeManager" version="18">
    <extensionMap>
        ... ...
      <mapping ext="mp4" type="Native" />
        ... ...
    </extensionMap>
  </component>
</application>
```

依葫芦画瓢，我添加了一条 `mapping` ，变成了下面这样：

```xml
<application>
  <component name="FileTypeManager" version="18">
    <extensionMap>
        ... ...
      <mapping ext="mp4" type="Native" />
        <mapping ext="md" type="Native" />
        ... ...
    </extensionMap>
  </component>
</application>
```

再打开 idea ，就可以用本地应用打开 markdown 了

# maven指定

![2021-12-20_054803](assets/image/2021-12-20_054803-16406964959812.png)

# springboot initializr 加速

把原来的

```
https://start.spring.io
```

改成：

```
https://start.aliyun.com/
```

或：

```
https://start.springboot.io/
```

# 插件安装

- Alibaba Java Coding Guidelines
- Codota







