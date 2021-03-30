---
layout: post
title: "通过代码调用Storyboard中的scene —— Call Storyboard Scene Programmatically"
date: 2013-11-21 20:26
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
通过Storyboard搭建app框架，以及设计和实现一些view
controller和view，是非常方便和高效的。

有时，同样一个scene(i.e. view
controller)，除了在Storyboard上通过segue达到以外，还需要在代码的某个地方，让它展现出来。

如何在代码中，调用一个已经在storyboard中设计好的scene呢？代码如下：

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
5</code></pre></td>
<td class="code"><pre><code>NSString * storyboardName = @&quot;MainStoryboard_iPhone&quot;;
NSString * viewControllerID = @&quot;ViewID&quot;;
UIStoryboard * storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
MyViewController * controller = (MyViewController *)[storyboard instantiateViewControllerWithIdentifier:viewControllerID];
[self presentViewController:controller animated:YES completion:nil];</code></pre></td>
</tr>
</tbody>
</table>

注：代码段来自[Call storyboard scene programmatically (without needing
segue)?](http://stackoverflow.com/questions/10522957/call-storyboard-scene-programmatically-without-needing-segue)

##### 有两个注意的地方：

1.  上面代码中的storyboardName不要包括”.storyboard”后缀。即，如果你的Storyboard文档叫做“Main.storyboard”，那么storyboardName应该叫@“Main”
2.  注意：在Storyboard中，先给你的viewController加上ID，添加的地方如下图所示：在Indentity中的Storyboard
    ID。通过这个viewControllerID（图中的例子就是@“UserGuide”），在代码中找到这个vc。

![storyboardID](http://bigbelldev.com/images/blogs/storyboardID.png)

------------------------------------------------------------------------

关键字：代码中调用storyboard中的vc，代码中present storyboard scene


