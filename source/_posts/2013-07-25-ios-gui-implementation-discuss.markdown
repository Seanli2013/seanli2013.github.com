---
layout: post
title: "学习使用code实现iOS界面"
date: 2013-07-25 19:08
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
## 为什么要学习使用code实现iOS界面？

### iOS界面三种实现方式

code、IB、Storyboard这三种方式都可以实现iOS界面，哪种实现方式合适呢？众说纷纭，合理的答案是依情况而定——嘿，废话。作为iOS的初学者，该如何选择呢？

#### 发展趋势

最早时候，大家都用code，后来出现了IB（interface
builder），再后来出现了Storyboard。现在的初学者们，上来接触的就是Storyboard，因为苹果现在的官网教材也好、stanford有名的CS193P课程（2013年叫做Coding
Together: Developing Apps for iPhone and iPad,
可以在iTunesU中免费下载）都在推Storyboard。

#### 优缺点<sup>[1](#fn:1)</sup>

简单对比一下，更多优缺点比较，请搜搜看<sup>[2](#fn:2)</sup>。

<table>
<thead>
<tr class="header">
<th></th>
<th>方法</th>
<th>优点</th>
<th>缺点</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td></td>
<td>code</td>
<td>可以对界面掌控得非常精确；代码容易管理和追踪，很干净，控件属性等有修改可以非常容易看到</td>
<td>代码量大，略显麻烦；接手项目的新人不容易看清楚模块之间的关系</td>
</tr>
<tr class="even">
<td></td>
<td>ib</td>
<td>较容易地把界面设计出来</td>
<td>界面在ib中体现一部分，在code中体现一部分，阅读和维护起来有难度</td>
</tr>
<tr class="odd">
<td></td>
<td>Storyboard</td>
<td>较为清晰的体现各模块之间的关系；较容易把界面设计出来</td>
<td>也会借助code来实现一些界面；多人协作开发时，不好管理</td>
</tr>
</tbody>
</table>

可见，使用code实现界面是最基础的方式，ib和storyboard是希望减少工作量。学习使用code开发界面有助于新手理解其中的原理。

#### 新手要熟练使用code，也会Storyboard

真正干活的时候，大家可能会哪个用得熟就用哪个了。对于我们新手，有精力的话，三种方式都要精通。如果没有那么多精力，至少要熟练使用code实现，同时也要会使用Storyboard。因为Storyboard在快速实现demo时，或小项目你自己开发时，效率是非常高的，可以节约你大量时间。并且从发展角度看，Storyboard会做得越来越完善。

## 如何用code设置控件

推荐这篇文章：[IOS开发之纯代码界面—基本控件使用篇](http://www.cocoachina.com/bbs/read.php?tid=131516)，学习的时候，从第一课开始，一节一节仔细阅读。全是干货，非常容易的你就学会了。

------------------------------------------------------------------------

1.  [Storyboard看上去很美](http://blog.devtang.com/blog/2012/12/15/do-not-use-storyboard/).在这篇文章中，作者根据切身实践对优缺点进行了评述，值得借鉴[↩](#fnref:1)

2.  可以参考搜索结果:[iOS开发过程中，你更喜欢用Storyboard/xib做界面，还是直接用代码来写界面？](http://www.zhihu.com/question/20256649);
    [iPhone开发中，代码写界面和IB设计界面哪个更方便？](http://www.zhihu.com/question/19670944)[↩](#fnref:2)


