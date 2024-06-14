// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_selector/src/selector_item.dart';
import 'package:flutter_selector/src/widget/common_widget.dart';

/// Single Selector Widget
class SelectorSingleWidget extends StatefulWidget {
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
  final int position;
  final Function(SelectorItem item, int position) callBack;
  final GestureTapCallback? onTapLeft;
  final GestureTapCallback? onTapRight;

  final double? diameterRatio;
  final double? offAxisFraction;
  final double? magnification;
  final double? squeeze;
  final Widget? selectionOverlay;

  const SelectorSingleWidget(
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
      required this.position,
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
  _SelectorSingleWidgetState createState() => _SelectorSingleWidgetState();
}

class _SelectorSingleWidgetState extends State<SelectorSingleWidget>
    with CommonWidget {
  SelectorItem _selectorItem = SelectorItem.init();
  FixedExtentScrollController? _controller;

  @override
  void initState() {
    super.initState();
    if (widget.list.length > widget.position) {
      _selectorItem = widget.list[widget.position];
      _controller = FixedExtentScrollController(initialItem: widget.position);
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
                  int position = 0;
                  if (null != _controller) {
                    position = _controller!.selectedItem;
                  }
                  widget.callBack.call(_selectorItem, position);
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
          child: CupertinoPicker(
            backgroundColor: Colors.white,
            useMagnifier: true,
            scrollController: _controller,
            diameterRatio: widget.diameterRatio ?? 1,
            offAxisFraction: widget.offAxisFraction ?? 0.0,
            magnification: widget.magnification ?? 1.2,
            squeeze: widget.squeeze ?? 1.45,
            selectionOverlay: widget.selectionOverlay ??
                getSelectionOverlayWidget(
                    widget.padding, widget.padding, widget.lineColor),
            itemExtent: widget.itemExtent,
            onSelectedItemChanged: (position) {
              if (widget.list.length > position) {
                _selectorItem = widget.list[position];
              }
            },
            children:
                getChildren(widget.list, widget.textSize, widget.textColor),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
