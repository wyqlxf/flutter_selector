// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/material.dart';
import 'package:flutter_selector/src/selector_item.dart';
import 'package:flutter_selector/src/widget/link/selector_multiple_link_widget.dart';
import 'package:flutter_selector/src/widget/selector_double_widget.dart';
import 'package:flutter_selector/src/widget/selector_multiple_choice_widget.dart';
import 'package:flutter_selector/src/widget/selector_multiple_widget.dart';
import 'package:flutter_selector/src/widget/selector_single_widget.dart';

class Selector {
  /// The height of the popup selector.
  static double _height = 240;

  /// The radius of the popup selector.
  static double _radius = 6;

  /// The height of each item in the selector.
  static double _itemExtent = 48;

  /// The padding of the selector.
  static double _padding = 16;

  /// The text size of the selector.
  static double _textSize = 16;

  /// The text on the left side of the selector.
  static String _textLeft = '取消';

  /// The text on the right side of the selector.
  static String _textRight = '完成';

  /// The text color of the selector.
  static Color _textColor = const Color(0xFF333333);

  /// The text color of the left side of the selector.
  static Color _textColorLeft = const Color(0xFF808080);

  /// The text color of the right side of the selector.
  static Color _textColorRight = const Color(0xFFFF8000);

  /// The line color of the selector.
  static Color _lineColor = const Color(0xFFEBEBEB);

  /// The background color of the selector.
  static Color _backgroundColor = const Color(0xFFE0E0E0);

  /// The diameter ratio of the selector.
  static double? _diameterRatio;

  /// The off-axis fraction of the selector.
  static double? _offAxisFraction;

  /// The magnification of the selector.
  static double? _magnification;

  /// The squeeze of the selector.
  static double? _squeeze;

  /// Initialize the selector.
  static init({
    double height = 240,
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
    Color backgroundColor = const Color(0xFFE0E0E0),
    double? diameterRatio,
    double? offAxisFraction,
    double? magnification,
    double? squeeze,
  }) {
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
    _diameterRatio = diameterRatio;
    _offAxisFraction = offAxisFraction;
    _magnification = magnification;
    _squeeze = squeeze;
  }

  /// Show Single Selector
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
      double? diameterRatio,
      double? offAxisFraction,
      double? magnification,
      double? squeeze,
      Widget? selectionOverlay,
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
        ),
      ),
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
            diameterRatio: _diameterRatio ?? diameterRatio,
            offAxisFraction: _offAxisFraction ?? offAxisFraction,
            magnification: _magnification ?? magnification,
            squeeze: _squeeze ?? squeeze,
            selectionOverlay: selectionOverlay,
            callBack: callBack,
            onTapLeft: onTapLeft,
            onTapRight: onTapRight);
      },
    );
  }

  /// Show double selector
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
      double? diameterRatio,
      double? offAxisFraction,
      double? magnification,
      double? squeeze,
      Widget? selectionOverlay,
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
        ),
      ),
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
            diameterRatio: _diameterRatio ?? diameterRatio,
            offAxisFraction: _offAxisFraction ?? offAxisFraction,
            magnification: _magnification ?? magnification,
            squeeze: _squeeze ?? squeeze,
            selectionOverlay: selectionOverlay,
            callBack: callBack,
            onTapLeft: onTapLeft,
            onTapRight: onTapRight);
      },
    );
  }

  /// Display multiple selectors (unlimited number)
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
      double? diameterRatio,
      double? offAxisFraction,
      double? magnification,
      double? squeeze,
      Widget? selectionOverlay,
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
        ),
      ),
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
            diameterRatio: _diameterRatio ?? diameterRatio,
            offAxisFraction: _offAxisFraction ?? offAxisFraction,
            magnification: _magnification ?? magnification,
            squeeze: _squeeze ?? squeeze,
            selectionOverlay: selectionOverlay,
            callBack: callBack,
            onTapLeft: onTapLeft,
            onTapRight: onTapRight);
      },
    );
  }

  /// Display multiple selectors (support linkage, up to 4 levels)
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
      double? diameterRatio,
      double? offAxisFraction,
      double? magnification,
      double? squeeze,
      Widget? selectionOverlay,
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
        ),
      ),
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
            diameterRatio: _diameterRatio ?? diameterRatio,
            offAxisFraction: _offAxisFraction ?? offAxisFraction,
            magnification: _magnification ?? magnification,
            squeeze: _squeeze ?? squeeze,
            selectionOverlay: selectionOverlay,
            callBack: callBack,
            onTapLeft: onTapLeft,
            onTapRight: onTapRight);
      },
    );
  }

  /// Display a single selector (supports multiple selections)
  static showSingleMultipleChoiceSelector(BuildContext context,
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
      double iconWidth = 24,
      Color selectColor = const Color(0xFFFF8000),
      Color unSelectedColor = const Color(0xFF999999),
      String iconAssetName = '',
      final double? describeSize,
      final Color? describeColor,
      required Function(List<SelectorItem> selectorItems) callBack,
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
        ),
      ),
      builder: (BuildContext context) {
        return SelectorMultipleChoiceWidget(
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
            selectColor: selectColor,
            unSelectedColor: unSelectedColor,
            describeSize: describeSize,
            describeColor: describeColor,
            iconWidth: iconWidth,
            iconAssetName: iconAssetName,
            callBack: callBack,
            onTapLeft: onTapLeft,
            onTapRight: onTapRight);
      },
    );
  }
}
