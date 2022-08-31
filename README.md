## FlutterSelector是什么？
一个支持非联动和多级联动底部弹窗选择器

<br>

## 如何使用FlutterSelector?

如果你需要自定义选择器的高度、间距、字体颜色等等，并且期望在整个项目中统一，可以初始化自定义参数，否则无需调用
```dart
Selector.init(height: 300, radius: 8, itemExtent: 48, padding: 12, 
        textSize: 14, textLeft: '取消', textRight: '确定', textColor:Colors.black54, 
        textColorLeft:Colors.black26, textColorRight:Colors.black, lineColor: Colors.white24, backgroundColor: Colors.grey);
```
<br>

### 调用单个选择器
```dart
Selector.showSingleSelector(context, list: list, callBack: (selectorItem, position) {});
```
### 调用双个选择器
```dart
Selector.showDoubleSelector(context, listLeft: listLeft, listRight: listRight, 
    callBack: (selectorItemLeft, positionLeft, selectorItemRight, positionRight) {
  
    });
```
### 调用多个选择器
```dart
Selector.showMultipleSelector(context, list: list, listPosition: _positions, callBack: (selectorItems, positions) {});
```
<br>

### 调用多个选择器(支持联动)
```dart
Selector.showMultipleLinkSelector(context, list: list, listPosition: _positionsLink, callBack: (selectorItems, positions) {});
```
<br>

### 调用单个选择器（支持多选）
```dart
Selector.showSingleMultipleChoiceSelector(context, list: list, callBack: (List<SelectorItem> selectorItems) {});
```
<br>

### 其他说明
字体颜色、字体大小、间距等参数可以通过初始化传参，也可以在每一次调用方法的时候，进行传参，实现单个不同的样式效果。详情参见example

## 效果演示
![image](https://github.com/wyqlxf/flutter_selector/blob/master/example/effects/demo_img.jpg)
<br>

视频演示请参阅[VideoDemo](https://github.com/wyqlxf/flutter_selector/blob/master/example/effects/demo_video.mp4)