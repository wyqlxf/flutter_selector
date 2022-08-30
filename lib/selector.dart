// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/material.dart';
import 'package:flutter_selector/selector_item.dart';
import 'package:flutter_selector/widget/link/selector_multiple_link_widget.dart';
import 'package:flutter_selector/widget/selector_double_widget.dart';
import 'package:flutter_selector/widget/selector_multiple_widget.dart';
import 'package:flutter_selector/widget/selector_single_widget.dart';

/// 选择器
class Selector {
  // 弹出的高度
  static double _height = 240;

  // 弹出顶部的圆角
  static double _radius = 6;

  // 选择器内容(Item)的高度
  static double _itemExtent = 48;

  // 选择器内部的间距
  static double _padding = 16;

  // 选择器文字大小
  static double _textSize = 16;

  // 选择器顶部左侧文案
  static String _textLeft = '取消';

  // 选择器顶部右侧文案
  static String _textRight = '完成';

  // 选择器文字颜色
  static Color _textColor = const Color(0xFF333333);

  // 选择器顶部左侧文案的字体颜色
  static Color _textColorLeft = const Color(0xFF808080);

  // 选择器顶部右侧文案的字体颜色
  static Color _textColorRight = const Color(0xFFFF8000);

  // 选择器中间选中的覆盖样式线条颜色
  static Color _lineColor = const Color(0xFFEBEBEB);

  // 选择器顶部的背景颜色
  static Color _backgroundColor = const Color(0xFFE0E0E0);

  /// 初始化默认值，提供可自定义的参数(可选项)
  static init(
      {double height = 240,
      double radius = 6,
      double itemExtent = 48,
      double padding = 16,
      double textSize = 16,
      String textLeft = '取消',
      String textRight = '完成',
      Color textColor = const Color(0xFF333333),
      Color textColorLeft = const Color(0xFF808080),
      Color textColorRight = const Color(0xFFFF8000),
      Color lineColor = const Color(0xFFEBEBEB),
      Color backgroundColor = const Color(0xFFE0E0E0)}) {
    _height = height;
    _radius = radius;
    _itemExtent = itemExtent;
    _padding = padding;
    _textSize = textSize;
    _textLeft = textLeft;
    _textRight = textRight;
    _textColor = textColor;
    _textColorLeft = textColorLeft;
    _textColorRight = textColorRight;
    _lineColor = lineColor;
    _backgroundColor = backgroundColor;
  }

  /// 显示单个选择器
  static showSingleSelector(BuildContext context,
      {required List<SelectorItem> list,
      double? height,
      double? radius,
      double? itemExtent,
      double? padding,
      double? textSize,
      String? textLeft,
      String? textRight,
      Color? textColor,
      Color? textColorLeft,
      Color? textColorRight,
      Color? lineColor,
      Color? backgroundColor,
      int position = 0,
      required Function(SelectorItem item, int position) callBack,
      GestureTapCallback? onTapLeft,
      GestureTapCallback? onTapRight}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? _radius),
          topRight: Radius.circular(radius ?? _radius),
        )),
        builder: (BuildContext context) {
          return SelectorSingleWidget(
              list: list,
              height: height ?? _height,
              radius: radius ?? _radius,
              itemExtent: itemExtent ?? _itemExtent,
              padding: padding ?? _padding,
              textSize: textSize ?? _textSize,
              textLeft: textLeft ?? _textLeft,
              textRight: textRight ?? _textRight,
              textColor: textColor ?? _textColor,
              textColorLeft: textColorLeft ?? _textColorLeft,
              textColorRight: textColorRight ?? _textColorRight,
              lineColor: lineColor ?? _lineColor,
              backgroundColor: backgroundColor ?? _backgroundColor,
              position: position,
              callBack: callBack,
              onTapLeft: onTapLeft,
              onTapRight: onTapRight);
        });
  }

  /// 显示双个选择器
  static showDoubleSelector(BuildContext context,
      {required List<SelectorItem> listLeft,
      required List<SelectorItem> listRight,
      double? height,
      double? radius,
      double? itemExtent,
      double? padding,
      double? textSize,
      String? textLeft,
      String? textRight,
      Color? textColor,
      Color? textColorLeft,
      Color? textColorRight,
      Color? lineColor,
      Color? backgroundColor,
      int? positionLeft = 0,
      int? positionRight = 0,
      required Function(SelectorItem? itemLeft, int? positionLeft,
              SelectorItem? itemRight, int? positionRight)
          callBack,
      GestureTapCallback? onTapLeft,
      GestureTapCallback? onTapRight}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? _radius),
          topRight: Radius.circular(radius ?? _radius),
        )),
        builder: (BuildContext context) {
          return SelectorDoubleWidget(
              listLeft: listLeft,
              listRight: listRight,
              height: height ?? _height,
              radius: radius ?? _radius,
              itemExtent: itemExtent ?? _itemExtent,
              padding: padding ?? _padding,
              textSize: textSize ?? _textSize,
              textLeft: textLeft ?? _textLeft,
              textRight: textRight ?? _textRight,
              textColor: textColor ?? _textColor,
              textColorLeft: textColorLeft ?? _textColorLeft,
              textColorRight: textColorRight ?? _textColorRight,
              lineColor: lineColor ?? _lineColor,
              backgroundColor: backgroundColor ?? _backgroundColor,
              positionLeft: positionLeft,
              positionRight: positionRight,
              callBack: callBack,
              onTapLeft: onTapLeft,
              onTapRight: onTapRight);
        });
  }

  /// 显示多个选择器（没有数量限制）
  static showMultipleSelector(BuildContext context,
      {required List<List<SelectorItem>> list,
      double? height,
      double? radius,
      double? itemExtent,
      double? padding,
      double? textSize,
      String? textLeft,
      String? textRight,
      Color? textColor,
      Color? textColorLeft,
      Color? textColorRight,
      Color? lineColor,
      Color? backgroundColor,
      required List<int> listPosition,
      required Function(List<SelectorItem> selectorItems, List<int> positions)
          callBack,
      GestureTapCallback? onTapLeft,
      GestureTapCallback? onTapRight}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? _radius),
          topRight: Radius.circular(radius ?? _radius),
        )),
        builder: (BuildContext context) {
          return SelectorMultipleWidget(
              list: list,
              height: height ?? _height,
              radius: radius ?? _radius,
              itemExtent: itemExtent ?? _itemExtent,
              padding: padding ?? _padding,
              textSize: textSize ?? _textSize,
              textLeft: textLeft ?? _textLeft,
              textRight: textRight ?? _textRight,
              textColor: textColor ?? _textColor,
              textColorLeft: textColorLeft ?? _textColorLeft,
              textColorRight: textColorRight ?? _textColorRight,
              lineColor: lineColor ?? _lineColor,
              backgroundColor: backgroundColor ?? _backgroundColor,
              listPosition: listPosition,
              callBack: callBack,
              onTapLeft: onTapLeft,
              onTapRight: onTapRight);
        });
  }

  /// 显示多个选择器（支持联动，最多不超过4级）
  static showMultipleLinkSelector(BuildContext context,
      {required List<SelectorItem> list,
      double? height,
      double? radius,
      double? itemExtent,
      double? padding,
      double? textSize,
      String? textLeft,
      String? textRight,
      Color? textColor,
      Color? textColorLeft,
      Color? textColorRight,
      Color? lineColor,
      Color? backgroundColor,
      required List<int> listPosition,
      required Function(List<SelectorItem> selectorItems, List<int> positions)
          callBack,
      GestureTapCallback? onTapLeft,
      GestureTapCallback? onTapRight}) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius ?? _radius),
          topRight: Radius.circular(radius ?? _radius),
        )),
        builder: (BuildContext context) {
          return SelectorMultipleLinkWidget(
              list: list,
              height: height ?? _height,
              radius: radius ?? _radius,
              itemExtent: itemExtent ?? _itemExtent,
              padding: padding ?? _padding,
              textSize: textSize ?? _textSize,
              textLeft: textLeft ?? _textLeft,
              textRight: textRight ?? _textRight,
              textColor: textColor ?? _textColor,
              textColorLeft: textColorLeft ?? _textColorLeft,
              textColorRight: textColorRight ?? _textColorRight,
              lineColor: lineColor ?? _lineColor,
              backgroundColor: backgroundColor ?? _backgroundColor,
              listPosition: listPosition,
              callBack: callBack,
              onTapLeft: onTapLeft,
              onTapRight: onTapRight);
        });
  }
}
