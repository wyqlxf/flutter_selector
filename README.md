# FlutterSelector是什么？
一个支持非联动和多级联动底部弹窗选择器


# 如何使用FlutterSelector?

如果你需要自定义选择器的高度、间距、字体颜色等等，并且期望在整个项目中统一，可以初始化自定义参数，否则无需调用
```dart
Selector.init();
```

## Selector不需要支持联动
### 调用单个选择器
```dart
Selector.showSingleSelector()
```

### 调用双个选择器
```dart
Selector.showDoubleSelector()
```

### 调用多个选择器
```dart
Selector.showMultipleSelector()
```

## Selector需要支持联动
```dart
Selector.showMultipleLinkSelector()
```
