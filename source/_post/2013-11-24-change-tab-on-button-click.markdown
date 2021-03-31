---
layout: post
title: "点击button实现Storyboard中TabBar Controller的tab切换"
date: 2013-11-24 18:10
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
### 环境和想要实现的功能

在Storyboard上，TabBarController作为rootViewController，此时想要在某个tab的VC中，点击个button，跳转到另外的tab上。如下图所示：

![](http://bigbelldev.com/images/blogs/change_tab_vc_on_button.png)

上图中，在第一个Tab上，点击“点击此处，去新建和管理提醒”，会跳转到第二个Tab，显示全部提醒的列表，来新建和管理提醒。

### 实现代码：

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1
2</code></pre></td>
<td class="code"><pre><code>    AppDelegate *thisAppDelegate = [[UIApplication sharedApplication] delegate];
    [(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:1];</code></pre></td>
</tr>
</tbody>
</table>

分析：
我们在用代码创建app的时候，要在appDelegate中，去指定rootViewController。【不熟悉代码创建app的同学可以阅读这篇[学习使用code实现iOS界面](http://bigbelldev.com/blog/2013/07/25/ios-gui-implementation-discuss/)，在这篇blog中，推荐的[IOS开发之纯代码界面—基本控件使用篇](http://www.cocoachina.com/bbs/read.php?tid=131516)，非常适合新手学习code实现界面】在用Storyboard创建app的时候，虽然不用我们自己去指定rootViewController，但原理是一样的。

Storyboard中，app的入口箭头指向的VC，通常就是rootViewController。在这个例子中，就是UITabBarController。

通过

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>[[UIApplication sharedApplication] delegate]</code></pre></td>
</tr>
</tbody>
</table>

得到自己这个appDelegate，通过调用

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>(UITabBarController *)thisAppDelegate.window.rootViewController</code></pre></td>
</tr>
</tbody>
</table>

就得到了这个UITabBarController（的实例）。再使用UITabBarController（的实例）方法setSelectedIndex，去设定，要跳转到哪个Tab。

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>[(UITabBarController *)thisAppDelegate.window.rootViewController setSelectedIndex:1]</code></pre></td>
</tr>
</tbody>
</table>

就是跳转到index为1的Tab，也就是第二个Tab了。


