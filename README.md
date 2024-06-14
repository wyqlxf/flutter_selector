# flutter_selector
<a href="https://pub.dev/packages/flutter_selector">
  <img src="https://img.shields.io/badge/Pub-v1.0.3-blue" alt="Pub Version"/>
</a> &nbsp
<a href="https://opensource.org/licenses/MIT">
  <img src="https://img.shields.io/badge/License-MIT-red" alt="License: MIT"/>
</a> &nbsp 
<a name="Wiqwj"></a>

Language: English | [简体中文](https://github.com/wyqlxf/flutter_selector/blob/master/README_ZH.md)

# Intro
This is a customizable Flutter selector that allows you to customize the interface style, support single selection, multiple selection, and even linked selection between multiple lists.
<a name="Aug4A"></a>
# Features

- Support custom UI styles
- Support single list selector
- Support multiple list selectors
- Support linked selection between multiple list selectors
- Support multiple selection in single list selector
<a name="LIviQ"></a>
# Preview
![Preview](https://github.com/wyqlxf/flutter_selector/blob/master/preview_images/selector.gif)

<a name="rGKbd"></a>
# Get started
<a name="Iywln"></a>
## Install
Add the flutter_selector package to your [pubspec dependencies](https://pub.dev/packages/flutter_selector).
<a name="FF3he"></a>
## Usage
<a name="u5Vfp"></a>
### Initialize
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
### Call selector (single)
```
Selector.showSingleSelector(context,
        list: list, callBack: (selectorItem, position) {});
```
<a name="cCWAE"></a>
### Call selector (double)
```
Selector.showDoubleSelector(context,
        listLeft: listLeft,
        listRight: listRight,
        callBack: (selectorItemLeft, positionLeft, selectorItemRight,
            positionRight) {});
```
<a name="UKXLE"></a>
### Call selector (multiple)
```
Selector.showMultipleSelector(context,
        list: list,
        listPosition: _positions,
        callBack: (selectorItems, positions) {});
```
<a name="jGl7Q"></a>
### Call selector (multiple with linked selection)
```
Selector.showMultipleLinkSelector(context,
        list: list,
        listPosition: _positionsLink,
        callBack: (selectorItems, positions) {});
```
<a name="gTtt5"></a>
### Call selector (support multiple selection)
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