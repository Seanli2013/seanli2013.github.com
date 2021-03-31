---
layout: post
title: "学习iOS的单例模式实现"
date: 2013-07-25 20:42
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
## 为什么学习iOS的单例模式实现

从设计模式开始说起。[设计模式（Design
pattern）](http://baike.baidu.com/view/66964.htm)是一套被反复使用、多数人知晓的、经过分类编目的、代码设计经验的总结。使用设计模式是为了可重用代码、让代码更容易被他人理解、保证代码可靠性。
毫无疑问，设计模式于己于他人于系统都是多赢的，设计模式使代码编制真正工程化，设计模式是软件工程的基石，如同大厦的一块块砖石一样。

单例模式是设计模式中的一种，并且比较简单，在iOS开发中会常用到，所以新手可以先学习使用单例模式。

新手想了解更多设计模式，可以先了解一下[类之间的关系](http://blog.csdn.net/zhengzhb/article/details/7187278)，然后看看[设计模式一般遵循的6个原则](http://blog.csdn.net/zhengzhb/article/details/7278174)，之后可以了解下[23个设计模式](http://blog.csdn.net/zhengzhb/article/details/7331369)。这里23个设计模式，作者是针对java讲的，但对ios程序设计也一样非常有意义。设计模式本身就是最佳实践的一些总结，新手不必一口气把每个设计模式的奥义都搞清楚，只要了解有这种设计模式，在实践中逐步研究和理解，会更有效率。

对于iOS常用的设计模式，**推荐阅读**[破船之家](http://beyondvincent.com)写的[三篇iOS设计模式](http://beyondvincent.com/2013/05/05/ios%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F%E8%A7%82%E5%AF%9F%E8%80%85/)文章，此外，可以参考[iOS的一些基本设计模式](http://marshal.easymorse.com/archives/3296)。

## 什么是单例模式

单例模式，英文名叫Singleton。规定这个类只能同时存在一个实例，这个实例可以全局调用。

### 什么情况下使用

有个事你只想让一个人去做，这个人把这个事儿做怎么样，你又希望大家都知道，这种时候可以使用单例模式。这个模式可以用来做一些比较“专注”的任务，同时方便的把资源共享出来。

### 什么情况下不使用

有人说当这个单例类非常频繁会扩展时，单例模式不适用<sup>[1](#fn:1)</sup>。

还有违反了单一职责的设计原则，使代码之间耦合度变强，无法进行有效的单元测试<sup>[2](#fn:2)</sup>。
所以使用的时候要避免这些情况，尽量让单例不存在过于复杂的依赖性和继承，保证其松耦合等<sup>[3](#fn:3)</sup>。

## 单例模式实现

在[破船之家](http://beyondvincent.com)的[iOS设计模式(02):单例模式](http://beyondvincent.com/2013/05/09/ios%E8%AE%BE%E8%AE%A1%E6%A8%A1%E5%BC%8F02%E5%8D%95%E4%BE%8B%E6%A8%A1%E5%BC%8F/)文章中写得很清楚，分为使用ARC情况和非ARC情况。我尝试了其中ARC+GCD的方法，it
works fine。

### 测试代码

在下面测试代码中，实现了2个viewController都从单例类实例中拿数据，第1个viewController的按钮更改了单例类实例的内容，在第2个viewController中可以看到更改。
[代码下载](http://seanli2013.github.io/codes/testSingleton.zip)

------------------------------------------------------------------------

1.  [使用单例模式需要注意的几个问题](http://www.nowamagic.net/librarys/veda/detail/1776)——这篇文章我看得一头雾水，应该怎么理解？[↩](#fnref:1)

2.  [What is so bad about
    Singletons?](http://stackoverflow.com/questions/137975/what-is-so-bad-about-singletons)，这个问题的被采纳答案[↩](#fnref:2)

3.  [Singletons in Cocoa, are they
    evil?](http://gracelancy.com/?p=386)推荐大家看这个，这个里面援引了stackflow中有人提到的单例的4个缺点。[↩](#fnref:3)


