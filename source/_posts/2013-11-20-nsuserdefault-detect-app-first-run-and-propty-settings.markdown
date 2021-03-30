---
layout: post
title: "NSUserDefault 常用功能 检测应用（或app的某个版本）第一次运行 或 记录用户设定的属性”"
date: 2013-11-20 16:36
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
NSUserDefault，从名称也可看出，一般用来记录用户的设置的。这里介绍两种常用场景：**检测应用（或app的某个版本）第一次运行**
和 **记录用户设定的属性**。

### 原理

几句话说下我的理解：

1.  NSUserDefault使用方法standardUserDefaults得到全局的一个[单例](http://bigbelldev.com/blog/2013/07/25/singleton/)
2.  在这个单例是个dictionary，即通过key-object来存、取信息
3.  信息会存在plist文件中，你不删它，它就一直存在

### 检测app第一次运行

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
9</code></pre></td>
<td class="code"><pre><code>    // 以下这段代码，检查是否app的这个版本是否是第一次运行
    NSString *bundleVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    NSString *appFirstStartOfVersionKey = [NSString stringWithFormat:@&quot;first_start_%@&quot;, bundleVersion];
    NSNumber *alreadyStartedOnVersion = [[NSUserDefaults standardUserDefaults] objectForKey:appFirstStartOfVersionKey];
    if(!alreadyStartedOnVersion || [alreadyStartedOnVersion boolValue] == NO) {
        [self versionFirstStart];// app的bundleVersion这个版本第一次运行，你希望这时做点儿什么
        [[NSUserDefaults standardUserDefaults] setObject:[NSNumber numberWithBool:YES] forKey:appFirstStartOfVersionKey];
    }
}</code></pre></td>
</tr>
</tbody>
</table>

每次启动app时候，调用这段代码。检查一个叫做first\_start\_加版本号这么个key，对应的NSNumber类型Object，是否存在，或是否是0（NO），如果不存在，或者是0（NO），那么是这个版本的第一次运行，这时做你想在app第一次运行时做的事儿，比如\[self
versionFirstStart\]，之后在plist中添加这个key对应的NSNumber类型object，设置成1（YES）。这样，以后app只要未改变版本，启动时就再也不会执行\[self
versionFirstStart\]了。

[参见stackoverflow](http://stackoverflow.com/questions/7758775/detecting-the-first-ever-run-of-an-app/7758850#7758850)

P.S.
虽然我并未更改这段代码进行更多尝试，但肯定不一定非要NSNumber这个类型，只要plist能存储和读取的类型就可以。

### 记录用户设定的属性

想设定一个属性，你给这个属性起个独有的key，比如叫做@“your property
key”。

设置属性：

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>[[NSUserDefaults standardUserDefaults] setObject:@&quot;off&quot; forKey:@&quot;your property key&quot;];</code></pre></td>
</tr>
</tbody>
</table>

读取和判断属性：

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
<td class="code"><pre><code>if([[[NSUserDefaults standardUserDefaults] objectForKey:@&quot;your property key&quot;] isEqualToString:@&quot;off&quot;])
{
}</code></pre></td>
</tr>
</tbody>
</table>

### 更多你要了解的NSUserDefault

##### 1. 可存储的类型

NSUserDefault中存储的object的格式只能是以下列表中的类型，这是plist存储方式决定的。

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
7</code></pre></td>
<td class="code"><pre><code>array
dictionary
data
date
number - integer
number - floating point
Boolean</code></pre></td>
</tr>
</tbody>
</table>

了解更多，可查阅[Property List Programming
Guide](https://developer.apple.com/library/mac/documentation/cocoa/Conceptual/PropertyLists/Introduction/Introduction.html#//apple_ref/doc/uid/10000048i)

##### 2. 自动存储

使用NSUserDefault，默认是自动存储的，即你修改完之后，ios自动找个时候，同步（synchronize）一下内存和plist。

手动存储可直接调用synchronize方法：

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>[[NSUserDefaults standardUserDefaults] synchronize];</code></pre></td>
</tr>
</tbody>
</table>

##### 3. 查看目前NSUserDefaults standardUserDefaults中的内容

查看全部dict内容

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>NSLog(@&quot;%@&quot;, [[NSUserDefaults standardUserDefaults] dictionaryRepresentation]);</code></pre></td>
</tr>
</tbody>
</table>

当然，也可以查看全部的key

<table>
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td class="gutter"><pre class="line-numbers"><code>1</code></pre></td>
<td class="code"><pre><code>NSLog(@&quot;%@&quot;, [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] allKeys]);</code></pre></td>
</tr>
</tbody>
</table>


