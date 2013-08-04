---
layout: post
title: "学习iOS的手势gestures"
date: 2013-08-04 17:36
comments: true
published: true
categories: iOS入门 
---
### iOS手势简介
iOS的手势，就是程序识别到你在屏幕上做的一些手势动作，做出反应。常见的手势有

* UITapGestureRecognizer
* UISwipeGestureRecognizer
* UIRotationGestureRecognizer
* UIPanGestureRecognizer
* UIPinchGestureRecognizer
* UILongPressGestureRecognizer

其中tap还有单击、双击，Swipe还有向上、下、左、右等区分。

识别这些手势，对每种手势做个反应，没啥难度。下面总结了5个步骤，和几个特殊的地方。

### 使用过程分5步
step1: 声明和初始化一个手势识别器

```
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTap:)];
    UITapGestureRecognizer *twoFingerTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTwoFingerTap:)];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(handleRotation:)];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(handlePinch:)];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
```

step2：对手势识别器进行属性设定

```
	[doubleTap setNumberOfTapsRequired:2];
    [twoFingerTap setNumberOfTouchesRequired:2];
    [swipeLeft setNumberOfTouchesRequired:1];
    [swipeLeft setDirection:UISwipeGestureRecognizerDirectionLeft];
    [swipeRight setNumberOfTouchesRequired:1];
    [swipeRight setDirection:UISwipeGestureRecognizerDirectionRight];
```

step3：把手势识别器加到view中去

```
    [self.view addGestureRecognizer:singleTap];
    [self.view addGestureRecognizer:doubleTap];
    [self.view addGestureRecognizer:twoFingerTap];
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    [self.view addGestureRecognizer:rotation];
    [self.view addGestureRecognizer:pan];
    [self.view addGestureRecognizer:pinch];
    [self.view addGestureRecognizer:longPress];
```
    
step4：出现冲突时，要设定优先识别顺序

```
    [singleTap requireGestureRecognizerToFail:doubleTap];
    [singleTap requireGestureRecognizerToFail:twoFingerTap];
    [pan requireGestureRecognizerToFail:swipeRight];
    [pan requireGestureRecognizerToFail:swipeLeft];
```
step5：去实现处理扑捉到手势之后的动作
填写各个处理函数，如：

```
- (void)handleSingleTap:(UITapGestureRecognizer *)gestureRecognizer 
- (void)handleDoubleTap:(UITapGestureRecognizer *)gestureRecognizer 
- (void)handleTwoFingerTap:(UITapGestureRecognizer *)gestureRecognizer 
- (void)handleSwipe:(UISwipeGestureRecognizer *)gestureRecognizer 
- (void)handleRotation:(UIRotationGestureRecognizer *)gestureRecognizer 
- (void)handlePan:(UIPanGestureRecognizer *)gestureRecognizer 
- (void)handlePinch:(UIPinchGestureRecognizer *)gestureRecognizer 
- (void)handleLongPress:(UILongPressGestureRecognizer *)gestureRecognizer 

```
在实现的时候，有几个需要注意的地方：
### 注意几个小地方
#### 区分单击双击、滑动（Swipe）和拖拽（Pan）
在识别单击双击时，逻辑上应该只有判断非双击时，才判定为单击，否则永远都只会判断为单击；在识别滑动和拖拽时也是一样，应该先判断是否是swipe，不是则才是拖拽，否则都只会识别拖拽。实现方式见上面Step4，使用requireGestureRecognizerToFail方法。

#### 向每个方向滑动（Swipe）都是一个独立的手势
如果你想接受向多个方向的滑动，对每个方向都要声明一个手势，专门代表这个方向的滑动。向左向右就是两个，加上向上向下就是4个。

```
 UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipe:)];
```
然后，你在扑捉到滑动手势之后的处理函数中，去判断```UISwipeGestureRecognizer *```类型的```recognizer.direction```是属于：

* UISwipeGestureRecognizerDirectionLeft
* UISwipeGestureRecognizerDirectionUp
* UISwipeGestureRecognizerDirectionDown
* UISwipeGestureRecognizerDirectionRight

中的哪个，然后再进一步去处理。
### 测试代码
在下面测试代码中，实现了六个手势的处理。
[代码下载](http://bigbelldev.com/codes/testGestures.zip)


