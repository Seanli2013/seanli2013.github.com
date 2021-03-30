---
layout: post
title: "UITableViewCell在iOS7之后superview的问题"
date: 2013-10-12 22:36
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
### 在UITableView中针对某个Cell的操作

要针对某个UITableView中的Cell做些操作，比如对这个Cell的内容进行查看详细、编辑、删除、或者触发其他功能比如发短信、打电话等，删除、和点击这个Cell在UITableView的Delegate方法中提供，其他的操作就需要识别Cell上的控件（比如Button）对应的action是针对这个Cell的。

一种常用的方式是使用view的层次，在action中找到这个Cell：在

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath</code></pre></td>
</tr>
</tbody>
</table>

方法中，把这个Cell的Button加入到Cell的contentView的subView，并且为这个button添加Target。

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1
2
3</code></pre></td>
<td class="code"><pre><code>// Button 操作
[cell.contentView addSubview:cell.button];
[cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];</code></pre></td>
</tr>
</tbody>
</table>

之后在对应的

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>- (void)buttonAction:(id)sender</code></pre></td>
</tr>
</tbody>
</table>

action中，通过view的层次，去找到对应的Cell：

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
8</code></pre></td>
<td class="code"><pre><code>// iOS7 之前
- (void)editRemindAction:(id)sender
{
    UIButton *button = (UIButton *)sender;
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
  // 继续其他的处理
}</code></pre></td>
</tr>
</tbody>
</table>

### iOS7之后出的问题

在iOS7之后，这样的办法会报错，错误在通过

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>UITableViewCell *cell = (UITableViewCell *)[[]button superview] superview];</code></pre></td>
</tr>
</tbody>
</table>

的方式，得到的不是cell，所以在这行以下用到cell的地方，就会抛出异常。

原因是在iOS7中，在 UITableViewCell 和
UITableViewCell的ContentView之间，还有一个UITableViewCellScrollView，所以通过两次superview往上“爬”，是爬不到UITableViewCell的。

### 解决方式

直观地看，就是向上爬三次superview就行了。为了更好地处理这个问题，应该建立一个UIView的Category（因为这里使用的view的层次superview是UIView的方法），写个Category方法来区分不同情况来得到Cell：

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
15</code></pre></td>
<td class="code"><pre><code>@implementation UIView (GetCellFromContentviewSubview)
- (UITableViewCell *)getCellFromContentviewSubview
{
    if ([[[self superview] superview] isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)[[self superview] superview];
    }
    else if ([[[[self superview] superview] superview] isKindOfClass:[UITableViewCell class]]) {
        return (UITableViewCell *)[[[self superview] superview] superview];
    }
    else{
         NSLog(@&quot;Something Panic Happens&quot;);
    }
    return nil;
}
@end</code></pre></td>
</tr>
</tbody>
</table>

之后，把

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];</code></pre></td>
</tr>
</tbody>
</table>

替换成

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>UITableViewCell *cell = (UITableViewCell *)[button getCellFromContentviewSubview];</code></pre></td>
</tr>
</tbody>
</table>

就可以了。

### 讨论

另外一种办法是给控件的tag附上indexPath.row，之后在action中通过tag来得到对应的cell，但如果Cell不是静态的，indexPath.row是会变的。所以这不是一个好的办法。

但我所提供的这个办法，在stackoverflow上有1人给vote
down，不知道为什么被vote down。这种办法有什么问题吗？


