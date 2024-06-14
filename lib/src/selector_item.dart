// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

/// Selector Entity
class SelectorItem<T> {
  /// id
  String get id => _id;
  String _id = '';

  /// name
  String get name => _name;
  String _name = '';

  /// describe
  String get describe => _describe;
  String _describe = '';

  /// hideNext
  bool get hideNext => _hideNext;
  bool _hideNext = false;

  /// childList
  List<SelectorItem>? get childList => _childList;
  List<SelectorItem>? _childList;

  /// Other parameters included
  T? get param => _param;
  T? _param;

  /// Whether it is selected, true means yes, false means no
  bool check = false;

  /// Whether to support all selection, true means yes, false means no.
  bool supportSelectAll = false;

  SelectorItem(
      {required String id,
      required String name,
      String describe = '',
      List<SelectorItem>? childList,
      bool hideNext = false,
      bool isCheck = false,
      bool isSupportSelectAll = false,
      T? param}) {
    _id = id;
    _name = name;
    _describe = describe;
    _hideNext = hideNext;
    _childList = childList;
    check = isCheck;
    supportSelectAll = isSupportSelectAll;
    _param = param;
  }

  SelectorItem.init();

  @override
  String toString() {
    return 'SelectorItem{id: $_id, name: $_name, describe: $_describe, hideNext: $_hideNext, childList: $_childList, param: $_param, check: $check, supportSelectAll: $supportSelectAll}';
  }
}
