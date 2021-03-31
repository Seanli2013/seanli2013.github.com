---
layout: post
title: "iOS播放gif最棒的库，简单高效"
date: 2013-11-25 07:15
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
iOS 播放 gif最棒的库，简单高效。

Animated GIFs implemented the right way on iOS

------------------------------------------------------------------------

iOS上播放gif，没有自带的API，所以我找了现成的库，借过来使用。github上我对比了3个star数目较多的代码，最终选择了[OLImageView](https://github.com/ondalabs/OLImageView)。

参与对比的是OLImageView，[iOS\_AnimatedGif](https://github.com/scspijker/iOS_AnimatedGif)，[Animated-GIF-iPhone](https://github.com/arturogutierrez/Animated-GIF-iPhone)。

### 选择合适的库

对比的指标，我选择

##### 1. 效率高，占用内存小

只播放同样一个Gif，OLImageView占用内存是后两者的4/5。

（这个测试可能不完备，没有测试同时播放多个gif，或者播放不同类型gif的对比。但对我使用来讲，只播放这个Gif，就可以说明问题了。）

##### 2. 代码维护活跃

OLImageView近来都有更新。

后两个中，Animated-GIF-iPhone是从iOS\_AnimatedGif分出来的，两个都已经分别3年多、1年多没有更新了，虽然去年iOS\_AnimatedGif的作者在blog上说要做对ARC的支持，但也没看更新。

### OLImageView用法

大家可以在github上，看到[OLImageView](https://github.com/ondalabs/OLImageView)的用法，用法是描述如何从code中创建和使用，非常简单直白。

我在这里介绍一下实际在Storyboard中使用的方式。

##### 1. 文件拖入工程

下载的OLImageView文件共有6个，但只要把下面四个文件拖进你的工程即可：

![OLImageViewFilesInProject](http://bigbelldev.com/images/blogs/OLImageViewFilesInProject.png)

##### 2. Storyboard中设置UIImageView为OLImageView

正常拖入一个UIImageView，在这个view的CustomClass中设定为OLImageView：

![CustomClass](http://bigbelldev.com/images/blogs/CustomClass.png)

在Outlet中，设定为OLImageView类型

![Outlet](http://bigbelldev.com/images/blogs/Outlet.png)

##### 3. code中操作

在合适的地方，把gif设定进去，注意这里的UIImage要换成OLImage：

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>    [self.guideImageGif1 setImage:[OLImage imageNamed:@&quot;peaceful.gif&quot;]];//注意这里的image要使用OLImage</code></pre></td>
</tr>
</tbody>
</table>

我的gif是在scrolllView中播放，所以我还需要设定frame：

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>    [self.guideImageGif1 setFrame:self.myScrollView.frame];</code></pre></td>
</tr>
</tbody>
</table>

### 效果

我在“药提醒你”的帮助VC中，背景是个gif，具体效果，你可以下载个下来看看^\_^——右侧侧边栏“我的产品”。

### 最后

要是有时间，你尽量阅读一下库的代码。知其然也知其所以然。

我在这里也就写写用法，比较浅显。目的是能让有同样需求的同学，减少一点儿时间开销，哪怕只减少了几分钟，也值得了。


