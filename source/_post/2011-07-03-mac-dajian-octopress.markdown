---
layout: post
title: "Mac下搭建octopress"
date: 2011-07-03 05:59
comments: true
published: true
categories: ["Tools"]
tags: ["Tools"]
---
## 准备工作

### 安装Ruby（1.9.3）

mac自带的Ruby版本低，不能适用。mac安装Ruby1.9.3的过程参见[Mac安装Ruby on
Rails](http://www.hoowolf.net/2012/03/29/installing-ruby-on-rails-on-mac-os-x-lion/)，讲的非常清楚。现在有Ruby2.0.0，具体安装方式请google。

### 你的系统还应该装有git，rvm

## 开始搭建

搭建过程参考[使用Octopress +
Github管理blog](http://ishalou.com/blog/2012/10/15/how-to-use-octopress/)和[Ruby开源项目介绍(1)：octopress——像黑客一样写博客](http://www.yangzhiping.com/tech/octopress.html)，这第二篇有些标题党哈。这两篇都可参考。

**注意:**参考这两篇文章前，需要***先安装Ruby1.9.3***，否则按照他们说的步骤来，你可能遇到很多个步骤无法执行完全成功。

## 安装过程中可能遇到的问题

### 1. 如何在mac系统中root权限？

用sudo su，像这样：

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
<td class="code"><pre><code>shawntekiMacBook-Pro:~ shawnli$ su
Password:
su: Sorry
shawntekiMacBook-Pro:~ shawnli$ sudo su
Password:
sh-3.2#</code></pre></td>
</tr>
</tbody>
</table>

### 2. bundle update不成功。

#### 如果遇到的是bundle，command not found

这时你需要安装bundle

    shawntekiMacBook-Pro:~ shawnli$ gem install bundler

这时你可能遇到不成功

    shawntekiMacBook-Pro:~ shawnli$ gem install bundler
    WARNING:  RubyGems 1.2+ index not found for:


    RubyGems will revert to legacy indexes degrading performance.
    ERROR:  could not find gem bundler locally or in a repository

很可能是网络的问题，你可以尝试使用代理或者从公网换成教育网什么的……成功后显示

    shawntekiMacBook-Pro:~ shawnli$ gem install bundler
    Successfully installed bundler-1.3.5
    1 gem installed
    Installing ri documentation for bundler-1.3.5...
    Installing RDoc documentation for bundler-1.3.5...

使用下面命令可以查看bundle安装情况

    gem list --local

如果bundle
update报找不到Gemfile，只要你切换到gemfile那个目录再运行bundle
update即可。


