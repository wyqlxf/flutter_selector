// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selector/selector_item.dart';
import 'package:flutter_selector/widget/common_widget.dart';

/// 双选择器部件
class SelectorDoubleWidget extends StatefulWidget {
  final List<SelectorItem> listLeft;
  final List<SelectorItem> listRight;
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
  final int positionLeft;
  final int positionRight;
  final Function(SelectorItem itemLeft, int positionLeft,
      SelectorItem itemRight, int positionRight) callBack;
  final GestureTapCallback? onTapLeft;
  final GestureTapCallback? onTapRight;

  const SelectorDoubleWidget(
      {Key? key,
      required this.listLeft,
      required this.listRight,
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
      required this.positionLeft,
      required this.positionRight,
      required this.callBack,
      this.onTapLeft,
      this.onTapRight})
      : super(key: key);

  @override
  _SelectorDoubleWidgetState createState() => _SelectorDoubleWidgetState();
}

class _SelectorDoubleWidgetState extends State<SelectorDoubleWidget>
    with CommonWidget {
  late SelectorItem _selectorItemLeft;
  late FixedExtentScrollController _controllerLeft;

  late SelectorItem _selectorItemRight;
  late FixedExtentScrollController _controllerRight;

  @override
  void initState() {
    super.initState();
    if (widget.listLeft.length > widget.positionLeft) {
      _selectorItemLeft = widget.listLeft[widget.positionLeft];
      _controllerLeft =
          FixedExtentScrollController(initialItem: widget.positionLeft);
    }
    if (widget.listRight.length > widget.positionRight) {
      _selectorItemRight = widget.listRight[widget.positionRight];
      _controllerRight =
          FixedExtentScrollController(initialItem: widget.positionRight);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.callBack.call(
                      _selectorItemLeft,
                      _controllerLeft.selectedItem,
                      _selectorItemRight,
                      _controllerRight.selectedItem);
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
            children: [
              Expanded(
                  child: CupertinoPicker(
                backgroundColor: Colors.white,
                diameterRatio: 1,
                useMagnifier: true,
                magnification: 1.2,
                scrollController: _controllerLeft,
                selectionOverlay: getSelectionOverlayWidget(
                    widget.padding, 0, widget.lineColor),
                itemExtent: widget.itemExtent,
                onSelectedItemChanged: (position) {
                  if (widget.listLeft.length > position) {
                    _selectorItemLeft = widget.listLeft[position];
                  }
                },
                children: getChildren(
                    widget.listLeft, widget.textSize, widget.textColor),
              )),
              Expanded(
                  child: CupertinoPicker(
                backgroundColor: Colors.white,
                diameterRatio: 1,
                useMagnifier: true,
                magnification: 1.2,
                scrollController: _controllerRight,
                selectionOverlay: getSelectionOverlayWidget(
                    0, widget.padding, widget.lineColor),
                itemExtent: widget.itemExtent,
                onSelectedItemChanged: (position) {
                  if (widget.listRight.length > position) {
                    _selectorItemRight = widget.listRight[position];
                  }
                },
                children: getChildren(
                    widget.listRight, widget.textSize, widget.textColor),
              )),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerLeft.dispose();
    _controllerRight.dispose();
  }
}
