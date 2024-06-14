// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selector/src/selector_item.dart';
import 'package:flutter_selector/src/widget/common_widget.dart';

/// Multiple selector widgets (unlimited quantity)
class SelectorMultipleWidget extends StatefulWidget {
  final List<List<SelectorItem>> list;
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

  const SelectorMultipleWidget(
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
  _SelectorMultipleWidgetState createState() => _SelectorMultipleWidgetState();
}

class _SelectorMultipleWidgetState extends State<SelectorMultipleWidget>
    with CommonWidget {
  late List<SelectorItem> _selectorItems;
  late List<FixedExtentScrollController> _controllers;

  @override
  void initState() {
    super.initState();
    _selectorItems = [];
    _controllers = [];
    for (int i = 0; i < widget.list.length; i++) {
      List<SelectorItem> selectorItems = widget.list[i];
      int position = 0;
      if (widget.listPosition.length > i) {
        position = widget.listPosition[i];
      }
      if (selectorItems.length > position) {
        _selectorItems.add(selectorItems[position]);
        _controllers.add(FixedExtentScrollController(initialItem: position));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];
    for (int i = 0; i < widget.list.length; i++) {
      List<SelectorItem> selectorItems = widget.list[i];
      FixedExtentScrollController? controller;
      if (_controllers.length > i) {
        controller = _controllers[i];
      }
      children.add(
        Expanded(
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
                    i == 0 ? widget.padding : 0,
                    i == (widget.list.length - 1) ? widget.padding : 0,
                    widget.lineColor),
            itemExtent: widget.itemExtent,
            onSelectedItemChanged: (position) {
              if (_selectorItems.length > i) {
                _selectorItems[i] = selectorItems[position];
              }
            },
            children:
                getChildren(selectorItems, widget.textSize, widget.textColor),
          ),
        ),
      );
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
                  List<int> _listPosition = [];
                  for (FixedExtentScrollController value in _controllers) {
                    _listPosition.add(value.selectedItem);
                  }
                  widget.callBack.call(_selectorItems, _listPosition);
                  if (widget.onTapRight != null) {
                    widget.onTapRight!.call();
                  } else {
                    Navigator.of(context).pop();
                  }
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

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
    }
  }
}
