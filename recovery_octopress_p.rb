#!/usr/bin/env ruby
# This script (recovery_octopress_p.rb) convert Octopress post, more specific the body in 
# Octopress markdown files and it need that pages stay in local computer.  
# Its license is LGPL-2.1 and more details, you can look this FSF link:
# - https://www.gnu.org/licenses/old-licenses/lgpl-2.1.html
#
# It was developed for Fernando Ike de Oliveira <fike@midstorm.org>.
# 
# Some bugs knows:
# - A problem to convert "." in title to dot word. Octopress was do much better
# - The "-" incresead more than need. For example: foo---bar instead foo-bar
# - You need to  create a directory _post for this script work
# 
#  
require 'nokogiri'
require 'pandoc-ruby'
require 'time'
require 'pathname'

# files = Dir.glob("/Users/xiangli/Develop/Blog/bigbelldev.com/seanli2013.github.com/**/201[0-9]/**/*.html")
files = Dir.glob("**/201[0-9]/**/*.html")
files.each { |file|
  puts "-- Hi --"

  doc = Nokogiri::HTML(File.open(file))


  title = doc.xpath('/html/body/div/div/div/article/header/h1').children
  date = doc.xpath('/html/body/div/div/div/article/header/p/time').attr('datetime')

  t_html = doc.xpath('/html/body/div/div/div/article/div')
  t_html_string = t_html.to_s

  puts title
  puts date


  # get file name for markdown
  path = Pathname.new(file)
  path_string = path.realpath.to_s
  path_arr = path_string.split('/')
  arr_count = path_arr.count
  real_md_file_name = "place_holder"
  if arr_count >= 2
    real_md_file_name = path_arr[arr_count - 2]
  end

  # markdown_strict, not markdown, bc there is some syntax of pandoc's markdown, like :::
  t_markdown = PandocRuby.convert(t_html_string, :from => :html, :to => :markdown_strict)

  puts t_markdown
  # t_markdown = PandocRuby.convert(t_html, :from => :html, :to => :markdown)
  categories = Array.new
  g_categories = doc.xpath('/html/body/div/div/div/article/footer/p/span[2]/a').children

  year = Time.parse(date).strftime("%Y")
  day = Time.parse(date).strftime("%d")
  month = Time.parse(date).strftime("%m")
  hour = Time.parse(date).strftime("%H")
  minute = Time.parse(date).strftime("%M")

  titlename = title.to_s.gsub(/\s+/, "-").downcase.tr("ÁÀÃáàãÉÈẼéèẽÍÌíìÓÒÕóòõÚÙúùÇç","AAAaaaEEEeeeIIiiOOOoooUUuucc")
  
  titlename = titlename.gsub(/[^0-9A-Za-z\-]/, '') 

  titlename = real_md_file_name

  filename = '_post/' + year + '-' + month + '-' + day + '-' + titlename + "\.markdown"

  categories = Array.new
    g_categories.each do |category|
      categories.push(category.to_s)
  end
    

text = <<EOF
---
layout: post
title: "#{title}"
date: #{year}-#{month}-#{day} #{hour}:#{minute}
comments: true
published: true
categories: #{categories}
tags: #{categories}
---
#{t_markdown}

EOF

  File.open(filename, "w+") { |f| f.write(text) }

}
