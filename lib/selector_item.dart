// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

/// 选择器Item实体类
class SelectorItem<T> {
  String _id = '';
  String _name = '';
  String _describe = '';
  bool _hideNext = false;
  List<SelectorItem>? _childList;
  T? _param;

  String get id => _id;

  String get name => _name;

  String get describe => _describe;

  bool get hideNext => _hideNext;

  List<SelectorItem>? get childList => _childList;

  T? get param => _param;

  bool check = false;
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
    return 'id:$id name:$name';
  }
}
