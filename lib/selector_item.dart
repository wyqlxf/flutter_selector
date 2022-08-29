// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

/// 选择器Item实体类
class SelectorItem<T> {
  String _id = '';
  String _name = '';
  List<SelectorItem>? _childList;
  T? _param;

  String get id => _id;

  String get name => _name;

  List<SelectorItem>? get childList => _childList;

  T? get param => _param;

  SelectorItem(
      {required String id,
      required String name,
      List<SelectorItem>? childList,
      T? param}) {
    _id = id;
    _name = name;
    _childList = childList;
    _param = param;
  }

  SelectorItem.init();

  @override
  String toString() {
    return 'id:$id name:$name';
  }
}
