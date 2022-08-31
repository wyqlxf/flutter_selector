// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/material.dart';
import 'package:flutter_selector/selector_item.dart';
import 'package:flutter_selector/widget/common_widget.dart';

/// 选择器多选部件
class SelectorMultipleChoiceWidget extends StatefulWidget {
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
  final double iconWidth;
  final Color selectColor;
  final Color unSelectedColor;
  final Function(List<SelectorItem> list) callBack;
  final GestureTapCallback? onTapLeft;
  final GestureTapCallback? onTapRight;

  const SelectorMultipleChoiceWidget(
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
      required this.callBack,
      required this.iconWidth,
      required this.selectColor,
      required this.unSelectedColor,
      this.onTapLeft,
      this.onTapRight})
      : super(key: key);

  @override
  _SelectorMultipleChoiceWidgetState createState() =>
      _SelectorMultipleChoiceWidgetState();
}

class _SelectorMultipleChoiceWidgetState
    extends State<SelectorMultipleChoiceWidget> with CommonWidget {
  @override
  void initState() {
    super.initState();
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
                  widget.callBack.call(widget.list);
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
          child: ListView(
            shrinkWrap: true,
            itemExtent: widget.itemExtent,
            children: getChildrenChoice(
                widget.list,
                widget.textSize,
                widget.padding,
                widget.textColor,
                widget.lineColor,
                widget.selectColor,
                widget.unSelectedColor,
                widget.iconWidth,
                callBack: (SelectorItem selectorItem, int position) {
              bool check = !selectorItem.check;
              if (selectorItem.supportSelectAll) {
                for (int i = 0; i < widget.list.length; i++) {
                  widget.list[i].check = check;
                }
              } else {
                widget.list[position].check = check;
              }
              setState(() {});
            }),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
