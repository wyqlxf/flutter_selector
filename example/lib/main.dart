// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

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
    _selectorItemsMultipleChoice = getMultipleChoiceData();
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
    StringBuffer _bufferMultipleChoice = StringBuffer();
    for (SelectorItem selectorItem in _selectorItemsMultipleChoice) {
      if (selectorItem.check) {
        if (selectorItem.id.isNotEmpty) {
          _bufferMultipleChoice.write(selectorItem.toString() + '\n');
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: MediaQuery.of(context).size.width, height: 20),
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
            const SizedBox(height: 20),
            TextButton(
                onPressed: _multipleChoiceSelector,
                child: const Text('点击选择器(单，条件多选)')),
            Text(_bufferMultipleChoice.toString()),
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
        list: getSingleData(),
        textColorRight: Colors.black,
        position: _position, callBack: (selectorItem, position) {
      _position = position;
      _selectorItem = selectorItem;
      setState(() {});
    });
  }

  /// *************************  双选择器 *************************///
  int? _positionLeft = 0;
  SelectorItem? _selectorItemLeft;
  int? _positionRight = 0;
  SelectorItem? _selectorItemRight;

  void _doubleSelector() {
    // 支持隐藏二级项
    Selector.showDoubleSelector(context,
        listLeft: getDoubleData()[0],
        listRight: getDoubleData()[1],
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
        list: getMultipleData(),
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
        list: getMultipleLinkData(),
        listPosition: _positionsLink, callBack: (selectorItems, positions) {
      _positionsLink = positions;
      _selectorItemsLink = selectorItems;
      setState(() {});
    });
  }

  /// *************************  单选择器(条件多选) *************************///

  List<SelectorItem> _selectorItemsMultipleChoice = [];

  void _multipleChoiceSelector() {
    Selector.showSingleMultipleChoiceSelector(context,
        list: _selectorItemsMultipleChoice,
        textColor: const Color(0xFF666666),
        selectColor: Colors.lightBlueAccent,
        describeColor: const Color(0xFF999999),
        describeSize: 12, callBack: (List<SelectorItem> selectorItems) {
      _selectorItemsMultipleChoice = selectorItems;
      setState(() {});
    });
  }

  /// *************************  测试数据 *************************///

  List<SelectorItem> getSingleData() {
    List<SelectorItem> list = [];
    for (int i = 0; i < 7; i++) {
      list.add(SelectorItem(id: '${i + 1}', name: '星期${i + 1}'));
    }
    return list;
  }

  List<List<SelectorItem>> getDoubleData() {
    List<SelectorItem> list1 = [];
    for (int i = 0; i < 7; i++) {
      if (i == 0) {
        list1.add(
            SelectorItem(id: '${i + 1}', name: '动物${i + 1}', hideNext: true));
      } else {
        list1.add(SelectorItem(id: '${i + 1}', name: '动物${i + 1}'));
      }
    }
    List<SelectorItem> list2 = [];
    for (int i = 0; i < 7; i++) {
      list2.add(SelectorItem(id: '${i + 1}', name: '植物${i + 1}'));
    }
    return [list1, list2];
  }

  List<List<SelectorItem>> getMultipleData() {
    List<SelectorItem> list1 = [];
    for (int i = 0; i < 7; i++) {
      list1.add(SelectorItem(id: '${i + 1}', name: '金${i + 1}'));
    }
    List<SelectorItem> list2 = [];
    for (int i = 0; i < 7; i++) {
      list2.add(SelectorItem(id: '${i + 1}', name: '木${i + 1}'));
    }
    List<SelectorItem> list3 = [];
    for (int i = 0; i < 7; i++) {
      list3.add(SelectorItem(id: '${i + 1}', name: '水${i + 1}'));
    }
    List<SelectorItem> list4 = [];
    for (int i = 0; i < 7; i++) {
      list4.add(SelectorItem(id: '${i + 1}', name: '火${i + 1}'));
    }
    List<SelectorItem> list5 = [];
    for (int i = 0; i < 7; i++) {
      list5.add(SelectorItem(id: '${i + 1}', name: '土${i + 1}'));
    }
    return [list1, list2, list3, list4, list5];
  }

  List<SelectorItem> getMultipleLinkData() {
    List<SelectorItem> level1 = [];
    for (int i = 0; i < 7; i++) {
      List<SelectorItem> level2 = [];
      for (int j = 0; j < 7; j++) {
        List<SelectorItem> level3 = [];
        for (int k = 0; k < 7; k++) {
          List<SelectorItem> level4 = [];
          for (int m = 0; m < 7; m++) {
            SelectorItem selectorItem = SelectorItem(
                id: '${m + 1}', name: '${i + 1}${j + 1}${k + 1}火${m + 1}');
            level4.add(selectorItem);
          }
          SelectorItem selectorItem = SelectorItem(
              id: '${k + 1}',
              name: '${i + 1}${j + 1}水${k + 1}',
              childList: level4);
          level3.add(selectorItem);
        }
        SelectorItem selectorItem = SelectorItem(
            id: '${j + 1}', name: '${i + 1}木${j + 1}', childList: level3);
        level2.add(selectorItem);
      }
      SelectorItem selectorItem =
          SelectorItem(id: '${i + 1}', name: '金${i + 1}', childList: level2);
      level1.add(selectorItem);
    }
    return level1;
  }

  List<SelectorItem> getMultipleChoiceData() {
    List<SelectorItem> list = [
      SelectorItem(
          id: '',
          name: '全选',
          isCheck: false,
          isSupportSelectAll: true,
          describe: '这是一条描述文案')
    ];
    for (int i = 0; i < 7; i++) {
      list.add(SelectorItem(
          id: '${i + 1}', name: '星期${i + 1}', describe: '这是一条描述文案'));
    }
    return list;
  }
}
