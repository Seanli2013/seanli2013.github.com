---
layout: post
title: "iOS7 Autolayout 瞬间入门！"
date: 2013-10-23 20:05
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
Autolayout是非常先进的一个技术。使用这种技术，适应不同设备屏幕大小差异或设备翻转时对界面的要求，变得很容易。这种技术提供了一种灵活的机制来描述界面上各控件的位置关系。

Xcode5使Autolayout技术更容易使用了。
之前，我对Autolayout只是听说有这种机制，但不知原理、用法。于是阅读了下面的两篇文章（作者：
Matthijs Hollemans。目前貌似还没有翻译），算是在Storyboard/Xib上会用了。

-   [Beginning Auto Layout Tutorial in iOS 7: Part
    1](http://www.raywenderlich.com/50317/beginning-auto-layout-tutorial-in-ios-7-part-1)
-   [Beginning Auto Layout Tutorial in iOS 7: Part
    2](http://www.raywenderlich.com/50319/beginning-auto-layout-tutorial-in-ios-7-part-2)

以下作为阅读笔记，记录应该了解的使用Autolayout的要点(环境是Xcode5，iOS7SDK，Storyboard/Xib)。

# 原理要点

-   Autolayout基本是靠constraints来描述两个view之间的位置关系
-   Autolayout与以往的frame、bound、center包括autosizing
    mask等方式都不同，这是一个新的技术，使用Autolayout时候就不用考虑以上那些方式啦，不用再纠结这个view的位置是(x,y,width,height)了！
-   Autolayout描述位置关系的这两个view，或者是上下层关系，或者是同一层关系。即父子关系或都是父的子（兄弟关系^\_^）
-   Constraints都是NSLayoutConstraint的对象，有一些属性可以在Attributes
    inspector中修改。当然也可以通过code的方式来实现Storyboard/Xib上的操作

# 使用方式

这里只介绍Storyboard/Xib使用方式，如果想了解code实现，还要继续阅读其他资料。

### 设计及实现方法：

理清view想要摆放的位置逻辑（设计），根据这个逻辑来设置Constraints（实现）。比如这个Button要距离那个Button固定20个点的距离，并且两个Button要顶端对齐等。把这些逻辑条件变成constraints，当constraints完备到可以确定view的位置时，就完成了设计和实现。

### 在Storyboard/Xib上使用

-   Autolayout的checkbox默认是check上的，这个配置是对整个Storyboard或整个Xib生效的

-   可以设置Constraints的地方

    1 Editor菜单下的Pin以上的4个菜单

    ![Editor](http://cdn2.raywenderlich.com/wp-content/uploads/2013/09/StrutsProblem-pin-widths-equally.png)

    2 在View层次列表中选中Constraints后，在Attributes Inspector中设置

    ![viewhierachy](http://cdn2.raywenderlich.com/wp-content/uploads/2013/09/Equal-widths-in-document-outline.png)
    ![Inspector](http://cdn2.raywenderlich.com/wp-content/uploads/2013/09/Tango-vertical-space-attributes.png)

    3 最方面快捷的方式是在悬浮在界面编辑右下角的几个图标

    ![quick
    menu](http://cdn2.raywenderlich.com/wp-content/uploads/2013/09/Auto-Layout-buttons.png)

-   蓝色的辅助线：表明Constraints已经足以说明这个view的位置了

![blue](http://cdn5.raywenderlich.com/wp-content/uploads/2013/09/Tango-left-align-constraint.png)

-   橙色的辅助线：表示constraints没有完备到可以说明这个view的位置

![orange](http://cdn5.raywenderlich.com/wp-content/uploads/2013/09/Tango-badge-on-V-space.png)

-   橙色的辅助线上的数字：有时是正数，有时是负数。当你设定或更改了Constraints的时候，可能Constraints与界面上你放置的view的位置是不同的。系统会以Constraints为准，界面上提示你橙色辅助线，线上的数字是这个view的位置与Constraints的差距。这时可以在“Resolve
    Auto Layout Issues”中选择update
    frame，这样这个view会自动移动到Constraints所指示的地方；也可以update
    constraints，这时view的位置不变，constraints变为与界面上的view位置一致的数值

-   对没有提供Constraints的view，系统会自动加上constraints，这些constraints是界面上不可见的。这一点是Xcode5与Xcode4在Autolayout技术升级上最大的改进！Xcode4是系统强加constraints，往往会对开发者进行了干扰，因为强加的Constraints往往不是你想要的。Xcode5的这个改进方便了开发者按照自己的意图去设计和实施：首先不用去修改系统强加的constraints；其次有些view的位置你不需要增加Constraints，就可以不用理会。注：这种自动给View加Constraints的方式只适用于你一个Constraints都没加的情况，如果你加了x方向的，y方向的也需要手动添加。

-   preview：preview可真方便，你一边在左侧（Portrait、4寸屏）设计实施，一边在preview中看到lanscape的样子或者在3.5寸屏中的样子

![preview](http://cdn2.raywenderlich.com/wp-content/uploads/2013/09/Storyboard-preview.png)

-   可设置的constraints的类别：
    1.  几个View之间对齐
        -   边缘对齐、中心对齐等
        -   这几个view宽、高相等等
    2.  相对距离。
        -   距离最近的一个view的距离
        -   两个view之间的距离
        -   距离顶端、底端、左边缘、右边缘的距离
        -   自己的宽、高

# 接下来

以上是一些基础要点，当你用Storyboard/Xib做设计的时候，基本就够用啦。如果觉得这些要点不够，可以参照Matthijs
Hollemans在这两篇文章中举的例子，这个例子将带你进行一步步操作。

有些特殊的场景，使用Storyboard/Xib的autolayout是无法实现，需要代码方式的autolayout来实现。代码实现主要围绕着对NSLayoutConstraint对象的操作。具体如何实现，等需要的时候再找时间研究了。


