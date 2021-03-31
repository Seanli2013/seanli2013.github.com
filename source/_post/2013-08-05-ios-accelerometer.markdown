---
layout: post
title: "学习iOS传感器的使用"
date: 2013-08-05 18:17
comments: true
published: true
categories: ["iOS入门"]
tags: ["iOS入门"]
---
### iOS涉及到的传感器

不用查资料，用过iPhone的同学都知道。iphone中有加速度传感器，可以感知手机在哪个方向上有加速度，比如屏幕的翻转、飞行控制游戏等都是利用这个特征做的；有指南针（貌似叫陀螺仪？），可以知道你的方向；还有定位装置，可以知道你现在的位置在哪里。

加速度传感器相关功能是由CoreMotion提供；指南针、定位信息相关功能由CoreLocation提供。

### CoreMotion

在CoreMotion.framework中，有下面这些类：

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
<td class="code"><pre><code>CMAccelerometerData
CMAttitude
CMDeviceMotion
CMGyroData
CMLogItem
CMMagnetometerData
CMMotionManager</code></pre></td>
</tr>
</tbody>
</table>

每个是做什么的，可以在官方文档中阅读，就不在这翻译了。其中实现对设备加速度的识别，主要是使用CMMotionManager。

### CMMotionManager

如何使用CMMotionManager？

Step1：产生一个CMMotionManager的实例mManager。

Step2：实例使用方法isAccelerometerAvailable判断加速度传感器是否可用。

Step3：如果可用，则通过方法setAccelerometerUpdateInterval设定采样频率。

Step4：最后使用startAccelerometerUpdatesToQueue:withHandler开始采样及对采样进行处理。

### 示例代码

我在下面的代码中，实现了一个小球在一个框中运动，运动的轨迹是根据手机的倾斜角度计算，运动的方向同倾斜的角度一致，并且倾斜角度越大运动速度越快。
[代码下载](http://bigbelldev.com/codes/testGravity.zip)
在代码的实现过程中，对view的层次有了更深的体会。此外，在给label供数的时候，发现刚好使用代理的方式，算是也对代理做了联系。

### 编码过程中遇到七七八八问题的记录

#### Code Sign error:

着手时，借鉴了[这个代码](http://code4app.com/ios/Gravity-View/4fb086d96803fa1b5e000000)，在编译时遇到了这个问题：

    Code Sign error: The identity 'iPhone Developer: Haomian Wang (33P29785DD)' doesn't match any valid certificate/private key pair in the default keychain

**原因：**

CodeSigning签署的不是你的provisioning，没法在真机上使用。

**解决办法：**

在TARGETS中的Build Settings里，找Code Signing
Identity，里面把不是自己的developer改成自己的provisioning。

![](http://bigbelldev.com/images/codeSignErr.png)

**注：**

借鉴的这份代码是使用acceleroImeter:didAccelerate方法来处理扑捉到的加速度信息，但这个方法已经在iOS5废弃了，现在都使用CoreMotion框架来实现。

#### 未添加CoreMotion.framework

编译自己代码时，首先出现了如下错误：

![](http://bigbelldev.com/images/frameworkErr.png)

**原因：**

原因是代码中使用了CoreMotion，但工程中没有添加CoreMotion.framework。这很常见：在使用CoreLocation等framework时，也要想着在工程中添加framework。

**解决办法：** 在下图处添加CoreMotion.framework

![](http://bigbelldev.com/images/addFramework.png)

#### 给工程改名字导致编译不过

这是个题外话，当时想给工程改个名字，结果改了之后，编译不过。 **原因：**

原因都是名字、路径更改导致的找不到文件。

**解决办法：**

改名字注意三点：

1.  修改了Project的名字后，Xcode会提示你一些其他地方也需要修改，你就按着提示修改；
2.  也修改本地文件夹的名字后，注意xcode工程中的文件列表文件名是否会变为红色，如果是红色，需要你再想办法重新加一下路径；
3.  工程中的BuildSettings，这里最好搜一下你原来的名字，进行更改。我遇到的编译不过都是这里的路径还保留着原来的名字，未作更改。


