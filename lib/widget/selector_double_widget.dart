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
  final int? positionLeft;
  final int? positionRight;
  final Function(SelectorItem? itemLeft, int? positionLeft,
      SelectorItem? itemRight, int? positionRight) callBack;
  final GestureTapCallback? onTapLeft;
  final GestureTapCallback? onTapRight;

  final double? diameterRatio;
  final double? offAxisFraction;
  final double? magnification;
  final double? squeeze;
  final Widget? selectionOverlay;

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
      this.diameterRatio,
      this.offAxisFraction,
      this.magnification,
      this.squeeze,
      this.selectionOverlay,
      this.onTapLeft,
      this.onTapRight})
      : super(key: key);

  @override
  _SelectorDoubleWidgetState createState() => _SelectorDoubleWidgetState();
}

class _SelectorDoubleWidgetState extends State<SelectorDoubleWidget>
    with CommonWidget {
  SelectorItem? _selectorItemLeft;
  FixedExtentScrollController? _controllerLeft;

  SelectorItem? _selectorItemRight;
  FixedExtentScrollController? _controllerRight;

  bool _hindNext = false;

  @override
  void initState() {
    super.initState();
    int positionLeft = widget.positionLeft ?? 0;
    if (widget.listLeft.length > positionLeft) {
      _selectorItemLeft = widget.listLeft[positionLeft];
      _controllerLeft = FixedExtentScrollController(initialItem: positionLeft);
      if (null != _selectorItemLeft) {
        bool? flag = _selectorItemLeft?.hideNext;
        if (null != flag) {
          _hindNext = flag;
        }
      }
    }
    int positionRight = widget.positionRight ?? 0;
    if (widget.listRight.length > positionRight) {
      _selectorItemRight = widget.listRight[positionRight];
      _controllerRight =
          FixedExtentScrollController(initialItem: positionRight);
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
                  if (_hindNext) {
                    widget.callBack.call(_selectorItemLeft,
                        _controllerLeft?.selectedItem, null, null);
                  } else {
                    widget.callBack.call(
                        _selectorItemLeft,
                        _controllerLeft?.selectedItem,
                        _selectorItemRight,
                        _controllerRight?.selectedItem);
                  }
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
                useMagnifier: true,
                scrollController: _controllerLeft,
                diameterRatio: widget.diameterRatio ?? 1,
                offAxisFraction: widget.offAxisFraction ?? 0.0,
                magnification: widget.magnification ?? 1.2,
                squeeze: widget.squeeze ?? 1.45,
                selectionOverlay: widget.selectionOverlay ??
                    getSelectionOverlayWidget(
                        widget.padding, 0, widget.lineColor),
                itemExtent: widget.itemExtent,
                onSelectedItemChanged: (position) {
                  if (widget.listLeft.length > position) {
                    _selectorItemLeft = widget.listLeft[position];
                    if (null != _selectorItemLeft) {
                      bool? flag = _selectorItemLeft?.hideNext;
                      if (null != flag) {
                        if (flag) {
                          if (!_hindNext) {
                            _hindNext = true;
                            setState(() {});
                          }
                        } else {
                          if (_hindNext) {
                            _hindNext = false;
                            setState(() {});
                          }
                        }
                      }
                    }
                  }
                },
                children: getChildren(
                    widget.listLeft, widget.textSize, widget.textColor),
              )),
              Visibility(
                  visible: !_hindNext,
                  child: Expanded(
                      child: CupertinoPicker(
                    backgroundColor: Colors.white,
                    useMagnifier: true,
                    scrollController: _controllerRight,
                    diameterRatio: widget.diameterRatio ?? 1,
                    offAxisFraction: widget.offAxisFraction ?? 0.0,
                    magnification: widget.magnification ?? 1.2,
                    squeeze: widget.squeeze ?? 1.45,
                    selectionOverlay: widget.selectionOverlay ??
                        getSelectionOverlayWidget(
                            0, widget.padding, widget.lineColor),
                    itemExtent: widget.itemExtent,
                    onSelectedItemChanged: (position) {
                      if (widget.listRight.length > position) {
                        _selectorItemRight = widget.listRight[position];
                      }
                    },
                    children: getChildren(
                        widget.listRight, widget.textSize, widget.textColor),
                  ))),
            ],
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controllerLeft?.dispose();
    _controllerRight?.dispose();
  }
}
