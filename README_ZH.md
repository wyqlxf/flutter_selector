# flutter_selector
<a href="https://pub.dev/packages/flutter_selector">
  <img src="https://img.shields.io/badge/Pub-v1.0.3-blue" alt="Pub Version"/>
</a> &nbsp
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-red" alt="License: MIT"/>
</a> &nbsp 
<a name="Wiqwj"></a>

Language： [English](https://github.com/wyqlxf/flutter_selector/blob/master/README.md) | 简体中文

# 介绍
这是一个自定义的Flutter选择器，可以自定义界面样式，支持单选、多选，甚至多个列表之间的联动选择。
<a name="Aug4A"></a>
# 特征

- 支持自定义UI样式
- 支持单个列表选择器
- 支持多个列表选择器
- 支持多个列表选择器联动
- 支持单个列表选择器多选
<a name="LIviQ"></a>
# 效果预览
![Preview](https://github.com/wyqlxf/flutter_selector/blob/master/preview_images/selector.gif)

<a name="rGKbd"></a>
# 开始使用
<a name="Iywln"></a>
## 安装
将 flutter_selector 包添加到你的 [pubspec 依赖项中](https://pub.dev/packages/flutter_selector)
<a name="FF3he"></a>
## 使用示例
<a name="u5Vfp"></a>
### 初始化
```
Selector.init(
        height: 300,
        radius: 8,
        itemExtent: 48,
        padding: 12,
        textSize: 14,
        textLeft: '取消',
        textRight: '确定',
        textColor: Colors.black54,
        textColorLeft: Colors.black26,
        textColorRight: Colors.black,
        lineColor: Colors.white24,
        backgroundColor: Colors.grey);
```
<a name="XIhgL"></a>
### 调用选择器（单）
```
Selector.showSingleSelector(context,
        list: list, callBack: (selectorItem, position) {});
```
<a name="ge6My"></a>
### 调用选择器（双）
```
Selector.showDoubleSelector(context,
        listLeft: listLeft,
        listRight: listRight,
        callBack: (selectorItemLeft, positionLeft, selectorItemRight,
            positionRight) {});
```
<a name="UKXLE"></a>
### 调用选择器（多个）
```
Selector.showMultipleSelector(context,
        list: list,
        listPosition: _positions,
        callBack: (selectorItems, positions) {});
```
<a name="jGl7Q"></a>
### 调用选择器（多个且支持联动）
```
Selector.showMultipleLinkSelector(context,
        list: list,
        listPosition: _positionsLink,
        callBack: (selectorItems, positions) {});
```
<a name="gTtt5"></a>
### 调用选择器（支持多选）
```
Selector.showSingleMultipleChoiceSelector(context,
        list: list, callBack: (List<SelectorItem> selectorItems) {});
```

# License
The MIT License (MIT) Copyright (c) 2022 WangYongQi

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

