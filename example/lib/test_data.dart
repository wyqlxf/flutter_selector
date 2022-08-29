// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter_selector/selector_item.dart';

/// 测试数据
class TestData {
  static List<SelectorItem> getSingleData() {
    List<SelectorItem> list = [];
    for (int i = 0; i < 7; i++) {
      list.add(SelectorItem(id: '${i + 1}', name: '星期${i + 1}'));
    }
    return list;
  }

  static List<List<SelectorItem>> getDoubleData() {
    List<SelectorItem> list1 = [];
    for (int i = 0; i < 7; i++) {
      list1.add(SelectorItem(id: '${i + 1}', name: '动物${i + 1}'));
    }
    List<SelectorItem> list2 = [];
    for (int i = 0; i < 7; i++) {
      list2.add(SelectorItem(id: '${i + 1}', name: '植物${i + 1}'));
    }
    return [list1, list2];
  }

  static List<List<SelectorItem>> getMultipleData() {
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

  static List<SelectorItem> getMultipleLinkData() {
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
}
