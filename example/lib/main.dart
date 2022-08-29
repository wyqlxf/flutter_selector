// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:example/test_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selector/selector.dart';
import 'package:flutter_selector/selector_item.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '选择器',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '选择器页面'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Selector.init(textColorRight: Colors.blueAccent);
  }

  @override
  Widget build(BuildContext context) {
    /// 支持联动和非联动的选择器
    /// 如果你希望项目中所有的选择器都使用一样的样式，可以初始化自定义参数
    /// 如果你希望有别个的选择器使用不同的样式，可以在调用选择器函数的时候，通过传参实现
    StringBuffer _buffer = StringBuffer();
    for (SelectorItem selectorItem in _selectorItems) {
      _buffer.write(selectorItem.toString() + '\n');
    }
    StringBuffer _bufferLink = StringBuffer();
    for (SelectorItem selectorItem in _selectorItemsLink) {
      _bufferLink.write(selectorItem.toString() + '\n');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 20),
            TextButton(
                onPressed: _singleSelector, child: const Text('点击选择器(单)')),
            Text('${_selectorItem ?? ''}'),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _doubleSelector, child: const Text('点击选择器(双)')),
            Text('${_selectorItemLeft ?? ''}  ${_selectorItemRight ?? ''}'),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _multipleSelector, child: const Text('点击选择器(多)')),
            Text(_buffer.toString()),
            const SizedBox(height: 20),
            TextButton(
                onPressed: _multipleLinkSelector,
                child: const Text('点击选择器(多，支持联动)')),
            Text(_bufferLink.toString()),
          ],
        ),
      ),
    );
  }

  /// *************************  单选择器 *************************///
  int _position = 0;
  SelectorItem? _selectorItem;

  void _singleSelector() {
    Selector.showSingleSelector(context,
        list: TestData.getSingleData(),
        textColorRight: Colors.black,
        position: _position, callBack: (selectorItem, position) {
      _position = position;
      _selectorItem = selectorItem;
      setState(() {});
    });
  }

  /// *************************  双选择器 *************************///
  int _positionLeft = 0;
  SelectorItem? _selectorItemLeft;
  int _positionRight = 0;
  SelectorItem? _selectorItemRight;

  void _doubleSelector() {
    Selector.showDoubleSelector(context,
        listLeft: TestData.getDoubleData()[0],
        listRight: TestData.getDoubleData()[1],
        positionLeft: _positionLeft,
        positionRight: _positionRight, callBack:
            (selectorItemLeft, positionLeft, selectorItemRight, positionRight) {
      _positionLeft = positionLeft;
      _selectorItemLeft = selectorItemLeft;
      _positionRight = positionRight;
      _selectorItemRight = selectorItemRight;
      setState(() {});
    });
  }

  /// *************************  多选择器 *************************///
  List<int> _positions = [];
  List<SelectorItem> _selectorItems = [];

  void _multipleSelector() {
    Selector.showMultipleSelector(context,
        list: TestData.getMultipleData(),
        listPosition: _positions, callBack: (selectorItems, positions) {
      _positions = positions;
      _selectorItems = selectorItems;
      setState(() {});
    });
  }

  /// *************************  多选择器(支持联动) *************************///

  List<int> _positionsLink = [];
  List<SelectorItem> _selectorItemsLink = [];

  void _multipleLinkSelector() {
    Selector.showMultipleLinkSelector(context,
        list: TestData.getMultipleLinkData(),
        listPosition: _positionsLink, callBack: (selectorItems, positions) {
      _positionsLink = positions;
      _selectorItemsLink = selectorItems;
      setState(() {});
    });
  }
}
