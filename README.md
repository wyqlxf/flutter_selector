## FlutterSelector
支持自定义样式的多级联动底部弹窗列表选择器

## 功能介绍

* 支持自定义UI样式
* 支持单个列表选择器
* 支持多个列表选择器
* 支持多个列表选择器联动
* 支持单个列表选择器多选

## Demo演示

视频演示请参阅[VideoDemo](https://github.com/wyqlxf/flutter_selector/blob/master/example/effects/demo_video.mp4)


## 安装
在 `pubspec.yaml` 中添加依赖：
```yaml
dependencies:
  flutter_selector: ^1.0.2
```

在终端中运行：

```bash
$ flutter packages get
```

## 使用
### 初始化
```dart
Selector.init(height: 300, radius: 8, itemExtent: 48, padding: 12, 
        textSize: 14, textLeft: '取消', textRight: '确定', textColor:Colors.black54, 
        textColorLeft:Colors.black26, textColorRight:Colors.black, lineColor: Colors.white24, backgroundColor: Colors.grey);
```
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
