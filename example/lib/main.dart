// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/material.dart';
import 'package:flutter_selector/flutter_selector.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_selector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'flutter_selector'),
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: body(),
    );
  }

  Widget body() {
    /// Supports linked and non-linked selectors
    /// If you want all selectors in the project to use the same style, you can initialize custom parameters
    /// If you want other selectors to use different styles, you can pass parameters when calling the selector function
    StringBuffer buffer = StringBuffer();
    for (SelectorItem selectorItem in _selectorItems) {
      if (buffer.isEmpty) {
        buffer.write(selectorItem.name);
      } else {
        buffer.write('\n' + selectorItem.name);
      }
    }
    StringBuffer bufferLink = StringBuffer();
    for (SelectorItem selectorItem in _selectorItemsLink) {
      if (bufferLink.isEmpty) {
        bufferLink.write(selectorItem.name);
      } else {
        bufferLink.write('\n' + selectorItem.name);
      }
    }
    StringBuffer bufferMultipleChoice = StringBuffer();
    for (SelectorItem selectorItem in _selectorItemsMultipleChoice) {
      if (selectorItem.check) {
        if (selectorItem.id.isNotEmpty) {
          if (bufferMultipleChoice.isEmpty) {
            bufferMultipleChoice.write(selectorItem.name);
          } else {
            bufferMultipleChoice.write('\n' + selectorItem.name);
          }
        }
      }
    }

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 16),
            TextButton(
                onPressed: _singleSelector, child: const Text('点击选择器(单)')),
            Text(_selectorItem?.name ?? ''),
            const SizedBox(height: 16),
            TextButton(
                onPressed: _doubleSelector, child: const Text('点击选择器(双)')),
            Text(
                '${_selectorItemLeft?.name ?? ''}  ${_selectorItemRight?.name ?? ''}'),
            const SizedBox(height: 16),
            TextButton(
                onPressed: _multipleSelector, child: const Text('点击选择器(多)')),
            Text(buffer.toString()),
            const SizedBox(height: 16),
            TextButton(
                onPressed: _multipleLinkSelector,
                child: const Text('点击选择器(多，支持联动)')),
            Text(bufferLink.toString()),
            const SizedBox(height: 16),
            TextButton(
                onPressed: _multipleChoiceSelector,
                child: const Text('点击选择器(单，条件多选)')),
            Text(bufferMultipleChoice.toString()),
          ],
        ),
      ),
    );
  }

  /// ************************* Single Selector ************************* ///
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

  /// ************************* Double selector ************************* ///
  int? _positionLeft = 0;
  SelectorItem? _selectorItemLeft;
  int? _positionRight = 0;
  SelectorItem? _selectorItemRight;

  void _doubleSelector() {
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

  /// ************************* Multiple Selectors ************************* ///
  List<int> _positions = [];
  List<SelectorItem> _selectorItems = [];

  void _multipleSelector() {
    Selector.showMultipleSelector(context,
        list: getMultipleData(),
        textSize: 12,
        listPosition: _positions, callBack: (selectorItems, positions) {
      _positions = positions;
      _selectorItems = selectorItems;
      setState(() {});
    });
  }

  /// **************** Multiple selectors (support linkage)  **************** ///

  List<int> _positionsLink = [];
  List<SelectorItem> _selectorItemsLink = [];

  void _multipleLinkSelector() {
    Selector.showMultipleLinkSelector(context,
        list: getMultipleLinkData(),
        textSize: 12,
        listPosition: _positionsLink, callBack: (selectorItems, positions) {
      _positionsLink = positions;
      _selectorItemsLink = selectorItems;
      setState(() {});
    });
  }

  /// *********** Single selector (conditional multiple selection) *********** ///

  List<SelectorItem> _selectorItemsMultipleChoice = [];

  void _multipleChoiceSelector() {
    Selector.showSingleMultipleChoiceSelector(context,
        list: _selectorItemsMultipleChoice,
        textSize: 14,
        textColor: const Color(0xFF666666),
        selectColor: Colors.lightBlueAccent,
        describeColor: const Color(0xFF999999),
        describeSize: 12, callBack: (List<SelectorItem> selectorItems) {
      _selectorItemsMultipleChoice = selectorItems;
      setState(() {});
    });
  }

  /// ***************************** Test Data ***************************** ///

  List<SelectorItem> getSingleData() {
    List<SelectorItem> list = [];
    for (int i = 0; i < 9; i++) {
      list.add(SelectorItem(id: '$i', name: '${(i + 1) * 1000} 元'));
    }
    return list;
  }

  List<List<SelectorItem>> getDoubleData() {
    List<SelectorItem> list1 = [];
    for (int i = 0; i < 10; i++) {
      if (i == 0) {
        list1.add(SelectorItem(id: '${i + 1}', name: '开放式', hideNext: true));
      } else {
        list1.add(SelectorItem(id: '${i + 1}', name: '$i房'));
      }
    }
    List<SelectorItem> list2 = [];
    for (int i = 0; i < 10; i++) {
      list2.add(SelectorItem(id: '${i + 1}', name: '$i厅'));
    }
    return [list1, list2];
  }

  List<List<SelectorItem>> getMultipleData() {
    const int count = 6;
    List<SelectorItem> list1 = [];
    for (int i = 0; i < count; i++) {
      list1.add(SelectorItem(id: '${i + 1}', name: '供应商${i + 1}'));
    }
    List<SelectorItem> list2 = [];
    for (int i = 0; i < count; i++) {
      list2.add(SelectorItem(id: '${i + 1}', name: '制造商${i + 1}'));
    }
    List<SelectorItem> list3 = [];
    for (int i = 0; i < count; i++) {
      list3.add(SelectorItem(id: '${i + 1}', name: '分销商${i + 1}'));
    }
    List<SelectorItem> list4 = [];
    for (int i = 0; i < count; i++) {
      list4.add(SelectorItem(id: '${i + 1}', name: '零售商${i + 1}'));
    }
    List<SelectorItem> list5 = [];
    for (int i = 0; i < count; i++) {
      list5.add(SelectorItem(id: '${i + 1}', name: '消费者${i + 1}'));
    }
    return [list1, list2, list3, list4, list5];
  }

  List<SelectorItem> getMultipleLinkData() {
    const int count = 6;
    List<SelectorItem> level1 = [];
    for (int i = 0; i < count; i++) {
      List<SelectorItem> level2 = [];
      for (int j = 0; j < count; j++) {
        List<SelectorItem> level3 = [];
        for (int k = 0; k < count; k++) {
          List<SelectorItem> level4 = [];
          for (int m = 0; m < count; m++) {
            SelectorItem selectorItem =
                SelectorItem(id: '${m + 1}', name: '零售商${m + 1}');
            level4.add(selectorItem);
          }
          SelectorItem selectorItem = SelectorItem(
              id: '${k + 1}', name: '分销商${k + 1}', childList: level4);
          level3.add(selectorItem);
        }
        SelectorItem selectorItem = SelectorItem(
            id: '${j + 1}', name: '制造商${j + 1}', childList: level3);
        level2.add(selectorItem);
      }
      SelectorItem selectorItem =
          SelectorItem(id: '${i + 1}', name: '供应商${i + 1}', childList: level2);
      level1.add(selectorItem);
    }
    return level1;
  }

  List<SelectorItem> getMultipleChoiceData() {
    List data = [
      {'id': '1', 'name': 'Nike', 'describe': '创新运动品牌，注重性能与时尚'},
      {'id': '2', 'name': 'Adidas', 'describe': '三条纹标志，运动与休闲结合'},
      {'id': '3', 'name': 'Zara', 'describe': '快时尚，迅速跟进潮流'},
      {'id': '4', 'name': 'Gucci', 'describe': '奢华时尚，标志性双G'},
      {'id': '5', 'name': 'Prada', 'describe': '意大利奢华，前卫设计'},
      {'id': '6', 'name': 'Burberry', 'describe': '英伦经典，标志性格纹'},
      {'id': '7', 'name': 'Versace', 'describe': '大胆奢华设计，闪耀魅力'}
    ];

    List<SelectorItem> list = [
      SelectorItem(id: '', name: '全选', isCheck: false, isSupportSelectAll: true)
    ];
    for (int i = 0; i < data.length; i++) {
      Map map = data[i];
      list.add(SelectorItem(
          id: map['id'], name: map['name'], describe: map['describe']));
    }
    return list;
  }
}
