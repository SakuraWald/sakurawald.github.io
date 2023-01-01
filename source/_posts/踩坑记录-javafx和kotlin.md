---
title: JavaFX和Kotlin
tags:
  - JavaFX
  - Kotlin
id: '807'
categories:
  - - uncategorized
date: 2021-07-31 00:53:22
---

# Kotlin & JavaFX

Java项目转化成Kotlin项目后，和JavaFX之间兼容遇到了一些问题。

## JavaFX支持库无法被导入

#### 描述

之前Java项目使用的是OpenJDK-16，在高版本的JDK中，JavaFX被当成外置模块而独立出了JDK。 因此，在之前Java项目中是通过导入Jar包的方式来使用JavaFX。 但是在Kotlin项目中，JavaFX的jar包无法被导入。

#### 解决方法

使用较低版本的JDK，如JDK-8。

## JavaFX无法注入Kotlin中被val修饰的变量

#### 描述

在Kotlin中，由于IDEA的代码分析存在一些问题，原本Java项目中某些字段会被解析为val变量。 而在Kotlin中，被val修饰的变量无法被后续修改，这将导致了JavaFX无法成功注入这些字段。 但更严重的是，当出现这个问题时，程序直到运行时都不会有任何报错。 错误表现为这些字段的值为null

#### 解决方法

使用var修饰需要被JavaFX注入的变量。

## 某些FXML文件在load时出现报错

#### 描述

当FXMLLoader在load()某些\*.FXML文件时，会出现报错。 这是因为IDEA在代码转化的时候，根据Kotlin的get/set规则修改了部分字段的名称，导致代码文件与FXML文件无法匹配。

#### 解决方法

将这些无法匹配的字段修改为与FXML文件一致

## Kotlin文件的Controller与FXML文件绑定

#### 描述

原先在FXML文件中指定Controller的方式为 Controller的全类名。 这是对于Java项目的。但对于Kotlin项目，在绑定Controller这一步也一样。（FXML文件指定Controller时并没有要求写后缀名，并且经过实际测试，在不改动FXML文件的情况下即可正确绑定Controller）

#### 解决方法

与Java写法一样即可。

## 部分FXML文件报出控件解析错误

#### 描述

原先FXML文件出现控件无法解析。

#### 解决方法

根据IDEA的提示，使用Alt + Enter来导入这些控件即可。