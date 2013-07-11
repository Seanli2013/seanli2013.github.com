---
layout: post
title: "octopress发表blog文章和管理blog"
date: 2011-07-11 5:59
comments: true
external-url:
categories: Tools
---


这里先只记下些简单的，其他高级应用可参考这位朋友的[配置](http://www.yanjiuyanjiu.com/blog/20130402/)，讲得很好很清晰。
###发表文章的过程
1. 本地建立一个新文章。rake new_post["new post title"]，在“source/_posts/”目录下生成一个markdown文件
2. 编辑这个markdown文件，你可以改名字，也可以改文件的内容
3. 使用命令rake generate，这时在本地把你添加的新文章做了生成
4. 使用命令rake preview，这时在浏览器中输入localhost:4000来在本地查看效果
5. 效果ok，使用命令rake deploy，把本地的部署到github服务端
6. 过一会儿之后，你的服务端的blog就更新成最新的啦

###修改页面
搭建好的octopress，默认只有blog和achieve两个页面，要增加页面需要两步：

1. 本地建立个新文件夹。位置没关系，命令使用rake new_page[new-page-title]，这个文件夹内应该会包含一个index.markdown的文件，如果没有这个文件，请新建一个
2. 在blog主页的导航栏上还需要新建个页面名称，否则在blog上是看不到你新建的页面的，这需要编辑

	```
	source/_includes/custom/navigation.html
	```

编辑后的结果类似：<!--more-->


	<ul class="main-navigation">
 	<li><a href="{{ root_url }}/">Blog</a></li>
  	<li><a href="{{ root_url }}/blog/archives">Archives</a></li>
  	<li><a href="{{ root_url }}/about">About Me</a></li>
  	<li><a href="{{ root_url }}/test">Test Field</a></li>
	</ul>	
实际上就是把blog主页上导航的部分指向你新建的页面所在的文件夹名称。
部署的方式与发表文章过程一致。
修改页面的方式也可参考[为octopress添加新的页面(page)](http://icodeit.org/2013/01/add-new-page-to-octopress/)，在这片文章中对一个典型的octopress博客的source目录布局进行了描述。
###编辑的文章的工具
我在用[Mou](http://mouapp.com)，markdown语言，挺好使的。