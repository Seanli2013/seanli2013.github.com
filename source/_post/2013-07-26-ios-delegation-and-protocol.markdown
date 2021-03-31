---
layout: post
title: "学习iOS的delegation的实现"
date: 2013-07-26 14:11
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
## 什么是delegation

delegation*\[ˌdelɪ’ɡeɪʃn\]*，中文叫委托，是两个类之间传递信息的一种方式。也是一种设计模式。

其作用和实现过程可以这么理解：

A类：A正在工作中发现，有的工作自己做不方便，需要委托别人帮忙做。A要制定个协议，委托的人要遵守这个协议，按照协议中的方法把工作给做了。A的属性有遵守这个协议的delegate，A知道这个delegate会帮助完成协议中的工作。

B类：B会受A委托，B类需要接受这个协议，把协议中的必须执行的方法给执行了。B有个属性是A的对象，在B类中把A的对象的delegate设置成B。

这里提到的协议，即protocol，不熟的孩纸可以仔细阅读[协议（Protocol）的用法和代码例子](http://www.cocoachina.com/newbie/basic/2010/0917/2106.html)

## 什么时候使用delegation

类之间传递信息可以有多种机制，除了delegation还有notification、observer等方式。一般两个类之间有点儿关系（比如view和subview，view和controller之间，使用delegate）的时候，经常使用delegation；两个模块之间没有啥关系，可能使用notification会更好。有兴趣的孩纸推荐阅读一下[When
to use Delegation, Notification, or Observation in
iOS](http://blog.shinetech.com/2011/06/14/delegation-notification-and-observation/)。

在我们使用控件如textField、textView等时，都会碰到他们的delegation，这是非常好的delegation的例子，要好好去理解delegation的功效。

## delegation实践

### 模拟场景

张老师在外地开会，她会发短信告诉学生代表什么时候让学生们放假，学生代表承诺老师会准确传达。张老师发了短信给学生代表，说7月26日周五大家放假。

### 设计

张老师是委托人，学生代表是受委托人，她和学生代表定的协议中的方法：由学生代表告诉学生们什么时候放假。
张老师发短信给学生代表这个时候会触发他们之间协议的方法。

### 测试代码

测试代码中有老师和学生代表两个类，输出的结果见NSLog。[代码下载](http://seanli2013.github.io/codes/textDelegationAndProtocol.zip)


