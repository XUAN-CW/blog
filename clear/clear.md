---
title: clear
date: 2021-10-10 09:28:10
tags: 
- Windows
categories: 
id: 1633829290163017900
---



```
@echo off
for /f "tokens=*" %%i in ('dir/s/b/ad^|sort /r') do rd "%%i"
```

