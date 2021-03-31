---
layout: post
title: "更新xcode5.1后要注意的两点"
date: 2014-03-13 21:52
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
这几天手机更新了iOS7.1，xcode也更新到了5.1，之后就跳进了两个坑……

#### 1.UITableviewCell在Xcode5.1中默认未勾选Clip Subviews

**结果会导致靠改变Cell的高度，隐藏一些内容的时候，无法隐藏成功：**

![X-CellTallHeight](http://bigbelldev.com/images/blogs/X-CellTallHeight.png)

当switch turn off的时候，想得到：

![X-CellShortHeight](http://bigbelldev.com/images/blogs/X-CellShortHeight.png)

结果得到：

![X-CellShortHeightUnexpected](http://bigbelldev.com/images/blogs/X-CellShortHeightUnexpected.png)

**解决办法，就是勾选上Cell的Clip
Subviews。code实现这个功能的时候也需要注意：set clipsToBounds = YES**

为什么Xcode5.1中默认改为未勾选呢？在[Xcode 5.1 Release
Notes](https://developer.apple.com/LIBRARY/ios/releasenotes/DeveloperTools/RN-Xcode/Introduction/Introduction.html)中没提，所以，是为什么呢？欢迎指点

在《Xcode 5.1 Release Notes》中倒是提了下面这个“坑”：

#### 2.默认Arm64编译

**结果会导致不支持64位的部分都报错啦。**

因为Xcode5.1把Arm64加入到了Standard
architectures中，所以**解决办法就是别使用“Standard architectures”。**

可以在Targets—&gt;Build
Settings—&gt;Architectures中，选择Other，然后增加“+”，录入进去armv7，再添加上armv7s，删除$(ARCH\_STANDARD)，如下图：

![X-ModifyArch](http://bigbelldev.com/images/blogs/X-ModifyArch.png)

------------------------------------------------------------------------

看起来修改了这两个，就和原来没啥差别了。我的项目还没用到《Xcode 5.1
Release Notes》中提到的其他更新点。


