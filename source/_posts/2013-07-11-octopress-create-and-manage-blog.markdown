---
layout: post
title: "Octopress发表blog文章和管理blog"
date: 2011-07-13 05:59
comments: true
published: true
categories: ["Tools"]
tags: ["Tools"]
---
## octopress的官方文档

##### octopress的官方文档写得非常清晰和简洁，你需要的，基本他都教给你了。虽然中文的大家写的octopress的使用博文非常非常多，但还是建议你先阅读一遍octopress的官方文档，你可以从全貌上了解octopress都能做哪些。

[Octopress Documentation](http://octopress.org/docs/)

### 发表文章的过程

1.  本地建立一个新文章。rake new\_post\[“new post
    title”\]，在“source/\_posts/”目录下生成一个markdown文件
2.  编辑这个markdown文件，你可以改名字，也可以改文件的内容
3.  使用命令rake generate，这时在本地把你添加的新文章做了生成
4.  使用命令rake
    preview，这时在浏览器中输入localhost:4000来在本地查看效果
5.  效果ok，使用命令rake deploy，把本地的部署到github服务端
6.  过一会儿之后，你的服务端的blog就更新成最新的啦

### 管理和配置界面

管理和配置界面，就是修改你本地的若干配置文件，之后rake
generate成功后，再deploy，就完成了修改。

#### 拿增加页面为例

搭建好的octopress，默认只有blog和achieve两个页面，要增加页面需要两步：

1.  本地建立个新文件夹。位置没关系，命令使用rake
    new\_page\[new-page-title\]，这个文件夹内应该会包含一个index.markdown的文件，如果没有这个文件，请新建一个

2.  在blog主页的导航栏上还需要新建个页面名称，否则在blog上是看不到你新建的页面的，这需要编辑

    `  source/_includes/custom/navigation.html`

编辑后的结果类似：

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
6</code></pre></td>
<td class="code"><pre><code>&lt;ul class=&quot;main-navigation&quot;&gt;
  &lt;li&gt;&lt;a href=&quot;/&quot;&gt;Blog&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href=&quot;/blog/archives&quot;&gt;Archives&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href=&quot;/about&quot;&gt;About Me&lt;/a&gt;&lt;/li&gt;
      &lt;li&gt;&lt;a href=&quot;/test&quot;&gt;Test Field&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;   </code></pre></td>
</tr>
</tbody>
</table>

实际上就是把blog主页上导航的部分指向你新建的页面所在的文件夹名称。
部署的方式与发表文章过程一致。

修改页面的方式也可参考[为octopress添加新的页面(page)](http://icodeit.org/2013/01/add-new-page-to-octopress/)，在这片文章中对一个典型的octopress博客的source目录布局进行了描述。

再提一下评论，评论多数人说多说好用，多说的设置参考[为 Octopress
添加多说评论系统](http://ihavanna.org/internet/2013-02/add-duoshuo-commemt-system-into-octopress.html)。

更多的配置管理，可自行进行搜索，网上信息很多。比如这位朋友写的[配置](http://www.yanjiuyanjiu.com/blog/20130402/)。

**最推荐的应该是先阅读这个octopress的[官网](http://octopress.org)**，信息量非常大。例如[Blogging
Basics](http://octopress.org/docs/blogging/)详细儿清晰地介绍了发表文章的过程。

### 编辑的文章的工具

我在用[Mou](http://mouapp.com)，markdown语言，挺好使的。


