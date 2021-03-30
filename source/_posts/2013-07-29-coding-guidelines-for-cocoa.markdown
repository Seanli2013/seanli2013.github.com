---
layout: post
title: "学习Apple的编码规范"
date: 2013-07-29 14:19
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
编码规范很重要，毕竟你的代码除了你，还有很多人可能需要阅读。遵守一个编码规范，可以使你的代码易于理解和维护。

使用编码规范是个基础技能，采用谁家的编码规范比较好呢？看你给谁工作了。对OC，苹果、google都有自己的一套编码规范，估计其他公司也都有自己成行的编码规范。

google家写过一个被广泛接受的C++编码规范，他家的oc编码规范是结合了苹果家的oc规范和他自家的c++规范。所以对于iOS新手，我觉得先了解一下苹果家的编码规范比较好。

苹果家的编码规范[Coding Guidelines for
Cocoa](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CodingGuidelines/CodingGuidelines.html#//apple_ref/doc/uid/10000146-SW1)。

简单翻译了下：

## 代码名称基础

### 基本原则

#### 清晰

1.  又清晰又简洁是最好的了，但简洁不如清晰重要
2.  总的讲不要使用单词的简写，除了非常非常常用的简写以外（[Acceptable
    Abbreviations and
    Acronyms](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CodingGuidelines/Articles/APIAbbreviations.html#//apple_ref/doc/uid/20001285-BCIHCGAE)），尽量使用单词全称，长点儿不要紧
3.  API的名称不要有歧义，一看你的API就知道是以什么方式做了什么事情，不要让人有疑问

#### 一致性

做某个事情代码通常都叫这个名字，比如tag、setStringValue，那么你也这么叫。你在不确定怎么起名字的时候，可以参考一些常用的名字：[Method
Arguments](https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/CodingGuidelines/Articles/NamingMethods.html#//apple_ref/doc/uid/20001282-1001865)

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16</code></pre></td>
<td class="code"><pre><code>...action:(SEL)aSelector
...alignment:(int)mode
...atIndex:(int)index
...content:(NSRect)aRect
...doubleValue:(double)aDouble
...floatValue:(float)aFloat
...font:(NSFont *)fontObj
...frame:(NSRect)frameRect
...intValue:(int)anInt
...keyEquivalent:(NSString *)charCode
...length:(int)numBytes
...point:(NSPoint)aPoint
...stringValue:(NSString *)aString
...tag:(int)anInt
...target:(id)anObject
...title:(NSString *)aString</code></pre></td>
</tr>
</tbody>
</table>

### 前缀

前缀一般是2到3个大写之母，可以用来给类、协议、函数、常量、typedef结构起名字时用。但不要给方法用，方法存在的命名空间是类定义的。也不要给结构体的字段使用（the
fields of a structure）//没明白是啥意思？

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Prefix</th>
<th style="text-align: left;">Cocoa Framework</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NS</td>
<td style="text-align: left;">Application Kit</td>
</tr>
<tr class="even">
<td style="text-align: left;">NS</td>
<td style="text-align: left;">Foundation</td>
</tr>
<tr class="odd">
<td style="text-align: left;">AB</td>
<td style="text-align: left;">Address Book</td>
</tr>
<tr class="even">
<td style="text-align: left;">IB</td>
<td style="text-align: left;">Interface Builder</td>
</tr>
</tbody>
</table>

### 字体排版规范

1
多个词在一起时，不要使用标点符号（包括下划线、斜杠等），一般词首字母大写即可。

-   具体到方法名，第一个词首字母小些，后面的词首字母大写，不要用前缀；
    `   fileExistsAtPath:isDirectory:  `

-   函数名、常量名使用相关联的类的同样的前缀，后面跟着的词首字母大写。
    `   NSRunAlertPanel   NSCellDisabled  `

2
避免使用下划线来命名私有方法名（要是命名一个实例变量名是可以的），这算是Apple的保留写法，如果使用了可能会和已存在的函数重名。

### 类和协议名

类名中应该包含一个名词来说明这个类（或者类的对象）是做什么的。并且这个雷鸣应该有个合适的前缀。例如NSString、NSDate、NSButton、UIApplication等等。

协议应该按照他们的行为命名

1
多数协议是一组方法的集合，并不是专门为了某个类服务的。这类协议的命名要区别于类的命名样子，一般都是加个ing

<table>
<thead>
<tr class="header">
<th style="text-align: left;">NSLocking</th>
<th style="text-align: left;">Good</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NSLock</td>
<td style="text-align: left;">Poor (seems like a name for a class)</td>
</tr>
</tbody>
</table>

2
还有一些协议是把一些没啥关系的方法放在一起，这种协议一般是协助一个类。这种情况下，这种协议可以和类名一样。例子就是NSObject。

### 头文件

1 定义一个独立的类或协议，这时类名和h文件名一样

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Header file</th>
<th style="text-align: left;">Declares</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NSLocale.h</td>
<td style="text-align: left;">The NSLocale class.</td>
</tr>
</tbody>
</table>

2 定义关联的一些类或协议，一般使用最初最基本的那个类的名字

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Header file</th>
<th style="text-align: left;">Declares</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">NSString.h</td>
<td style="text-align: left;">NSString and NSMutableString classes.</td>
</tr>
<tr class="even">
<td style="text-align: left;">NSLock.h</td>
<td style="text-align: left;">NSLocking protocol and NSLock, NSConditionLock, and NSRecursiveLock classes.</td>
</tr>
</tbody>
</table>

3
包含Framework的头文件，使用framework的名字+.h，包含这个framework的公共头文件。

<table>
<thead>
<tr class="header">
<th style="text-align: left;">Header file</th>
<th style="text-align: left;">Framework</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Foundation.h</td>
<td style="text-align: left;">Foundation.framework.</td>
</tr>
</tbody>
</table>

4
给另外一个framwork中的类增加API时，应该延用原始类的名字。例如NSBundleAdditions.h
header file of the Application Kit

5
相关联的函数和数据类型在一起时，使用一个最贴切的名字做头文件。例如NSGraphics.h
(Application Kit)，包含了相关的函数、常量、结构体、数据类型等。

以上是基础的明明规则，在苹果家的代码规范中，接下来分别介绍了方法命名、函数命名、属性和数据类型命名。新手都应该好好阅读下。

最后还专门为framework开发者提供了一些Tips和Techniques。有兴趣的童鞋也可好好阅读下。


