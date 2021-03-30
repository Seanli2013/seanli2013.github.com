---
layout: post
title: "Outlook 转移OST数据文件 IMAP账户"
date: 2013-11-13 10:17
comments: true
published: true
categories: ["Tools"]
tags: ["Tools"]
---
### 问题

windows8系统，装了Outlook2013，占用了C盘大约10G空间，主要都是数据文件（OST文件）占用的。希望能够把数据文件从C盘移至其他盘。并且账户是IMAP账户，不是Exchange。

google一下，绝大多数解决方案是针对以下两种情况：

-   使用Exchange的账户，如何做到移动ost文件
-   移动pst文件，而不是移动ost文件

都不适用。后来发现了这个解决方案，尝试后，成功！分享给大家：

### 解决方案

把ost文件移动到其他盘，在原来C盘的ost文件位置建立一个链接，链接到移动后的那个文件，大功告成。引用原作者的描述：

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
11</code></pre></td>
<td class="code"><pre><code>在Outlook2013 IMAP账户中

假设你目前的demo.pst文件在路径C:\Users\%username%\AppData\Local\Microsoft\Outlook下(已创建)

1. 关闭Outlook，移动此文件到D:\Outlook Files下。

2. 打开CMD，键入 mklink &quot;C:\Users\%username%\AppData\Local\Microsoft\Outlook\XXXX.com.ost&quot; &quot;E:\Profile\Outlook\XXXX.com.ost&quot;

3. 此时C:\Users\%username%\AppData\Local\Microsoft\Outlook下会有一个类似于快捷方式的同步文件demo.ost存在（0KB）。

4. 打开Outlook，IMAP账户仍然会挂接到C:\Users\%username%\AppData\Local\Microsoft\Outlook\demo.ost上，但该文件只是D盘下数据文件的映射，实际不消耗任何磁盘空间。</code></pre></td>
</tr>
</tbody>
</table>

原文地址：[Outlook2013
迁移OST存储位置](http://beijing-zhanglei.blog.sohu.com/272769443.html)

### 注意事项

使用的过程中有需要注意的地方：

##### 1~ 需要使用管理员身份运行cmd

windows8的应用程序那儿，搜素cmd，出来“命令提示符”，右键点击，这时屏幕下方会出现几个选项，选择“”以管理员身份运行”

##### 2~ 建立符号链接的位置的磁盘应该是NTFS格式

建立符号链接的位置，就是mklink后紧跟的参数的位置，如果不是NTFS格式的盘，恐怕就建立不了了。

### P.S. 我更喜欢Mac

虽然windows是个很伟大的系统，并且其中的很多软件也异常优秀，但我已经很久不用windows了。日常使用，我觉得Mac系统是胜过windows的，尤其是对编程写代码的人。

但windows你也得熟悉，一方面由于别人的或公共的电脑windows占比很高，另一方面老婆向你求助的时候，你得帮忙解决问题啊，就像今天这个分享写的这事儿。


