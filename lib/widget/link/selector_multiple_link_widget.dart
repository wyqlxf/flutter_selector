// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selector/selector_item.dart';
import 'package:flutter_selector/widget/common_widget.dart';

/// 多选择器部件（数量限制不超过4个，支持联动）
class SelectorMultipleLinkWidget extends StatefulWidget {
  final List<SelectorItem> list;
  final double height;
  final double radius;
  final double itemExtent;
  final double padding;
  final double textSize;
  final String textLeft;
  final String textRight;
  final Color textColor;
  final Color textColorLeft;
  final Color textColorRight;
  final Color lineColor;
  final Color backgroundColor;
  final List<int> listPosition;
  final Function(List<SelectorItem> selectorItems, List<int> positions)
      callBack;
  final GestureTapCallback? onTapLeft;
  final GestureTapCallback? onTapRight;

  final double? diameterRatio;
  final double? offAxisFraction;
  final double? magnification;
  final double? squeeze;
  final Widget? selectionOverlay;

  const SelectorMultipleLinkWidget(
      {Key? key,
      required this.list,
      required this.height,
      required this.radius,
      required this.itemExtent,
      required this.padding,
      required this.textSize,
      required this.textLeft,
      required this.textRight,
      required this.textColor,
      required this.textColorLeft,
      required this.textColorRight,
      required this.lineColor,
      required this.backgroundColor,
      required this.listPosition,
      required this.callBack,
      this.diameterRatio,
      this.offAxisFraction,
      this.magnification,
      this.squeeze,
      this.selectionOverlay,
      this.onTapLeft,
      this.onTapRight})
      : super(key: key);

  @override
  _SelectorMultipleWidgetLinkState createState() =>
      _SelectorMultipleWidgetLinkState();
}

class _SelectorMultipleWidgetLinkState extends State<SelectorMultipleLinkWidget>
    with CommonWidget {
  // 数据来源于外部，皆可为空
  int? _position0;
  SelectorItem? _selectorItem0;
  FixedExtentScrollController? _controller0;

  int? _position1;
  SelectorItem? _selectorItem1;
  FixedExtentScrollController? _controller1;

  int? _position2;
  SelectorItem? _selectorItem2;
  FixedExtentScrollController? _controller2;

  int? _position3;
  SelectorItem? _selectorItem3;
  FixedExtentScrollController? _controller3;

  final List<int> _listPosition = [];
  final List<SelectorItem> _selectorItems = [];

  @override
  void initState() {
    super.initState();
    // 最多支持不超过4个
    for (int i = 0; i < 4; i++) {
      int position = 0;
      if (widget.listPosition.length > i) {
        position = widget.listPosition[i];
      } else if (widget.listPosition.length < 4) {
        widget.listPosition.add(position);
      }
      _initData(i, position);
    }
  }

  /// 初始化数据
  _initData(int level, int position) {
    switch (level) {
      case 0:
        _position0 = position;
        if (widget.list.isNotEmpty) {
          _selectorItem0 = widget.list[position];
        }
        _controller0 = FixedExtentScrollController(initialItem: position);
        break;
      case 1:
        _position1 = position;
        _selectorItem1 = _selectorItem0?.childList?[position];
        _controller1 = FixedExtentScrollController(initialItem: position);
        break;
      case 2:
        _position2 = position;
        _selectorItem2 = _selectorItem1?.childList?[position];
        _controller2 = FixedExtentScrollController(initialItem: position);
        break;
      case 3:
        _position3 = position;
        _selectorItem3 = _selectorItem2?.childList?[position];
        _controller3 = FixedExtentScrollController(initialItem: position);
        break;
    }
  }

  /// 每次选择不同级的时候刷新数据
  _refreshData(int level, int position, bool jump) {
    switch (level) {
      case 0:
        _position0 = position;
        _selectorItem0 = widget.list[position];
        if (jump) {
          _controller0?.jumpToItem(position);
        }
        break;
      case 1:
        _position1 = position;
        _selectorItem1 = _selectorItem0?.childList?[position];
        if (jump) {
          _controller1?.jumpToItem(position);
        }
        break;
      case 2:
        _position2 = position;
        _selectorItem2 = _selectorItem1?.childList?[position];
        if (jump) {
          _controller2?.jumpToItem(position);
        }
        break;
      case 3:
        _position3 = position;
        _selectorItem3 = _selectorItem2?.childList?[position];
        if (jump) {
          _controller3?.jumpToItem(position);
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    _addLevel(List<SelectorItem>? selectorItems,
        FixedExtentScrollController? controller, int index) {
      // 如果数据不为空，才添加视图
      if (null != selectorItems) {
        children.add(Expanded(
            child: CupertinoPicker(
          backgroundColor: Colors.white,
          useMagnifier: true,
          scrollController: controller,
          diameterRatio: widget.diameterRatio ?? 1,
          offAxisFraction: widget.offAxisFraction ?? 0.0,
          magnification: widget.magnification ?? 1.2,
          squeeze: widget.squeeze ?? 1.45,
          selectionOverlay: widget.selectionOverlay ??
              getSelectionOverlayWidget(
                  index == 0 ? widget.padding : 0,
                  index == (widget.list.length - 1) ? widget.padding : 0,
                  widget.lineColor),
          itemExtent: widget.itemExtent,
          onSelectedItemChanged: (position) {
            for (int i = 0; i < 4; i++) {
              if (i == index) {
                _refreshData(i, position, false);
              } else if (i > index) {
                _refreshData(i, 0, true);
              }
            }
            setState(() {});
          },
          children:
              getChildren(selectorItems, widget.textSize, widget.textColor),
        )));
      }
    }

    // 循环添加视图(最多4级，多了不加)
    for (int i = 0; i < widget.listPosition.length; i++) {
      switch (i) {
        case 0:
          _addLevel(widget.list, _controller0, i);
          break;
        case 1:
          _addLevel(_selectorItem0?.childList, _controller1, i);
          break;
        case 2:
          _addLevel(_selectorItem1?.childList, _controller2, i);
          break;
        case 3:
          _addLevel(_selectorItem2?.childList, _controller3, i);
          break;
      }
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(widget.radius),
              topRight: Radius.circular(widget.radius),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: Text(
                    widget.textLeft,
                    style: TextStyle(
                        fontSize: widget.textSize, color: widget.textColorLeft),
                  ),
                ),
                onTap: widget.onTapLeft ??
                    () {
                      Navigator.of(context).pop();
                    },
              ),
              InkWell(
                child: Padding(
                  padding: EdgeInsets.all(widget.padding),
                  child: Text(
                    widget.textRight,
                    style: TextStyle(
                        fontSize: widget.textSize,
                        color: widget.textColorRight),
                  ),
                ),
                onTap: () {
                  _confirm();
                },
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          height: widget.height,
          child: Row(
            children: children,
          ),
        )
      ],
    );
  }

  /// 确认完成
  void _confirm() {
    _selectorItems.clear();
    if (null != _selectorItem0) {
      _selectorItems.add(_selectorItem0!);
    }
    if (null != _selectorItem1) {
      _selectorItems.add(_selectorItem1!);
    }
    if (null != _selectorItem2) {
      _selectorItems.add(_selectorItem2!);
    }
    if (null != _selectorItem3) {
      _selectorItems.add(_selectorItem3!);
    }
    _listPosition.clear();
    if (null != _position0) {
      _listPosition.add(_position0!);
    }
    if (null != _position1) {
      _listPosition.add(_position1!);
    }
    if (null != _position2) {
      _listPosition.add(_position2!);
    }
    if (null != _position3) {
      _listPosition.add(_position3!);
    }
    widget.callBack.call(_selectorItems, _listPosition);
    if (widget.onTapRight != null) {
      widget.onTapRight!.call();
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller0?.dispose();
    _controller1?.dispose();
    _controller2?.dispose();
    _controller3?.dispose();
  }
}
