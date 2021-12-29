---
title: 正则表达式
tags: 
date: 2021-12-28 23:34:25
id: 1640705665655606000
---
# 字符

## 普通字符

字母、数字、汉字、下划线、以及没有特殊定义的标点符号，都是“普通字符”。表达式中的普通字符，在匹配一个字符串的时候，匹配与之相同的一个字符。 

## 转义字符

|  符号   |  含义  |
| :-----: | :----: |
|   \n    | 换行符 |
|   \t    | 制表符 |
|   \\\   |   \    |
| \^  \\$ | ^   \$ |

## 标准字符集合

| 符号 |                含义                |
| :--: | :--------------------------------: |
|  \d  |         0~9的任意一个数字          |
|  \w  |     任意一个字母或数字或下划线     |
|  \s  | 括空格、制表符、换行符等空白字符的 |
|  .   |      任意一个字符(除了换行符)      |

注意：

可以用 `([\s\S]*)` ，也可以用 `([\d\D]*)`、`([\w\W]*)` 来匹配，就可以匹配包括换行符在内的任意字符。

## 自定义字符集合

| 符号 |                             含义                             | 表达式 |                           匹配结果                           |
| :--: | :----------------------------------------------------------: | :----: | :----------------------------------------------------------: |
|  []  |         方括号匹配方式，能够匹配方括号中任意一个字符         |  [1a]  | <span style='background-color:yellow'>1</span>23<span style='background-color:LightSteelBlue'>a</span>bc456 |
|  ^   |                             取反                             | [^1a]  | 1<span style='background-color:yellow'>2</span><span style='background-color:LightSteelBlue'>3</span>a<span style='background-color:yellow'>b</span><span style='background-color:LightSteelBlue'>c</span><span style='background-color:yellow'>4</span><span style='background-color:LightSteelBlue'>5</span><span style='background-color:yellow'>6</span> |
|  -   | 表示一个范围,如[A-F]匹配 "A"~"F"间的字符，[0-3]匹配 "0"~"3"间的字符 | [1-3]  | <span style='background-color:yellow'>1</span><span style='background-color:LightSteelBlue'>2</span><span style='background-color:yellow'>3</span>abc46 |

**注意：**

除  ^ ，- 之外， 正则表达式的特殊符号，被包含到中括号中，将失去特殊意义

# 量词

| 符号  |                 含义                  |   表达式   |                           匹配结果                           |
| :---: | :-----------------------------------: | :--------: | :----------------------------------------------------------: |
|  {n}  |             表达式重复n次             |   \d{4}    | 1a22a333a<span style='background-color:yellow'>4444</span>a<span style='background-color:LightSteelBlue'>5555</span>5a<span style='background-color:yellow'>6666</span>66a |
| {m,n} |    表达式至少重复m次，最多重复n次     |  \d{2,4}   | 1a<span style='background-color:yellow'>22</span>a333a<span style='background-color:yellow'>4444</span>a<span style='background-color:LightSteelBlue'>5555</span>5a<span style='background-color:yellow'>6666</span><span style='background-color:LightSteelBlue'>66</span>a |
| {m,}  |           表达式至少重复m次           |   \d{4,}   | 1a22a333a<span style='background-color:yellow'>4444</span>a<span style='background-color:LightSteelBlue'>55555</span>a<span style='background-color:yellow'>666666</span>a |
|   ?   |  匹配表达式0次或者1次，相当于 {0,1}   | \d\d\d\d?a | 1a22a<span style='background-color:yellow'>333a</span><span style='background-color:LightSteelBlue'>4444a</span>5<span style='background-color:yellow'>5555a</span>66<span style='background-color:LightSteelBlue'>6666a</span> |
|   +   |    表达式至少出现1次，相当于 {1,}     | \d\d\d\d+a | 1a22a333a<span style='background-color:yellow'>4444a</span><span style='background-color:LightSteelBlue'>55555a</span><span style='background-color:yellow'>666666a</span> |
|   *   | 表达式不出现或出现任意次，相当于 {0,} | \d\d\d\d*a | 1a22a<span style='background-color:yellow'>333a</span><span style='background-color:LightSteelBlue'>4444a</span><span style='background-color:yellow'>55555a</span><span style='background-color:LightSteelBlue'>666666a</span> |

**注意：**

表达式至少重复m次时，有以下两种模式：

|    模式    |       含义       |          设置方式           | 表达式  |                           匹配结果                           |
| :--------: | :--------------: | :-------------------------: | :-----: | :----------------------------------------------------------: |
|  贪婪模式  | 匹配字符越多越好 |            默认             | \d{4,}  |    <span style='background-color:yellow'>123456789</span>    |
| 非贪婪模式 | 匹配字符越少越好 | 特殊符号后再加上一个 "?" 号 | \d{4,}? | <span style='background-color:yellow'>1234</span><span style='background-color:LightSteelBlue'>5678</span>9 |

## 字符边界

| 符号 |                     含义                     | 表达式 |                       匹配结果                        |
| :--: | :------------------------------------------: | :----: | :---------------------------------------------------: |
|  ^   |            与字符串开始的地方匹配            |   ^1   | <span style='background-color:yellow'>1</span>234321  |
|  $   |            与字符串结束的地方匹配            |   1$   | 123432<span style='background-color:yellow'>1</span>  |
|  \b  | 匹配一个单词边界（前面或后面的字符不全是\w） |  \bi   | <span style='background-color:yellow'>i</span>_am_ice |

## 匹配模式

### IGNORECASE

忽略大小写模式：匹配时忽略大小写。

### SINGLELINE

单行模式：整个文本看作一个字符串，只有一个开头，一个结尾

### MULTILINE

多行模式：每行都是一个字符串，都有开头和结尾

**注意**：在指定了 MULTILINE 之后，如果需要仅匹配字符串开始和结束位置，可以使用 \A 和 \Z

### 预搜索(零宽断言)

**零宽度**：正则表达式匹配过程中，如果子表达式匹配到的是字符内容，而非位置，并被保存到最终的匹配结果中，那么就认为这个子表达式是占有字符的；如果子表达式匹配的仅是位置，或者匹配的内容并不保存到最终的匹配结果中，那么就认为这个子表达式是零宽度的。占有字符还是零宽度，是针对匹配的内容是否保存到最终的匹配结果中而言的。

| 语法     | 含义                                    |
| -------- | --------------------------------------- |
| (?=exp)  | 断言自身出现的位置的后面能匹配表达式exp |
| (?<=exp) | 断言自身出现的位置的前面能匹配表达式exp |
| (?!exp)  | 断言此位置的后面不能匹配表达式exp       |
| (?<!exp) | 断言此位置的前面不能匹配表达式exp       |

[正则表达式零宽断言详解](https://www.jb51.net/article/95906.htm)

# 常用正则

匹配所有除回车外所有不可见字符

```
[^
\S]
```

## 中文匹配

```
[\u4e00-\u9fa5]
```

## 匹配小括号

```
(\([^\)]*\))
```

```
//[^x]    匹配除了x以外的任意字符
//*    重复零次或更多次
//+    重复一次或更多次
```

## 匹配中括号

```
(\[[^\]]*\])
```

##  匹配代码块

注意，代码块需要指定语言，否则匹配不到

```
(?<=```.+\n)([\s\S]*?)(?=```)
```

## 匹配 a 标签

```
<\s*a[^>]*>(.*?)<\s*/\s*a>
```

## 匹配网址

```
(https?|ftp|file)://[-\w+&@#/%=~|?!:,.;]+[-\w+&@#/%=~|]
```

# 匹配 XML

## 匹配两标签之间

```
(<MavenGeneralSettings)([\s\S]*?)(</MavenGeneralSettings>)
```

## 匹配单标签

```
(<option)([\s\S]*?)(/>)
```

# 特殊字符匹配方法

## 共性

特殊字符匹配方法要具体看是哪个正则表达式引擎，但它们的操作步骤都是一样的，下面以**换行符**为例：

1. 根据 [ASCII](https://baike.baidu.com/item/ASCII/309296?fr=aladdin) 找出换行符的十六进制的换行符 
2. 根据具体正则表达式引擎添加前缀

## java 9-10

## GNU BRE (Linux)

# Linux 正则表达式引擎问题

## 查看可用的正则表达式引擎

以 **grep** 为例，使用指令 `grep --help` 可以查看其可以使用的正则表达式引擎

```
root@ubuntu-bionic:~# grep --help
Usage: grep [OPTION]... PATTERN [FILE]...
Search for PATTERN in each FILE.
Example: grep -i 'hello world' menu.h main.c

Pattern selection and interpretation:
  -E, --extended-regexp     PATTERN is an extended regular expression
  -F, --fixed-strings       PATTERN is a set of newline-separated strings
  -G, --basic-regexp        PATTERN is a basic regular expression (default)
  -P, --perl-regexp         PATTERN is a Perl regular expression

```

由此可知，grep 使用的默认正则表达式引擎为 **basic regular expression** ，即 [GNU BRE]() 

#  [BRE and ERE.html](assets/references/BRE and ERE.html) 



























































