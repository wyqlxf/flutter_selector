// Time: 14:10
// Date: 29/08/2022
// Copyright (c) 2022 W YongQi

import 'package:flutter/material.dart';
import 'package:flutter_selector/selector_item.dart';

/// 通用的部件
class CommonWidget {
  /// 列表Item
  List<Widget> getChildren(
      List<SelectorItem> list, double textSize, Color textColor) {
    List<Widget> children = [];
    for (SelectorItem item in list) {
      children.add(Center(
        child: Text(
          item.name,
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: textSize, color: textColor),
        ),
      ));
    }
    return children;
  }

  /// 自定义中间选中的覆盖样式
  Widget getSelectionOverlayWidget(double left, double right, Color color) {
    return Padding(
      padding: EdgeInsets.only(left: left, right: right),
      child: Column(
        children: [
          Divider(
            height: 1,
            color: color,
          ),
          const Spacer(),
          Divider(
            height: 1,
            color: color,
          ),
        ],
      ),
    );
  }

  /// 列表Item
  List<Widget> getChildrenChoice(
      List<SelectorItem> list,
      double textSize,
      double padding,
      Color textColor,
      Color lineColor,
      Color selectColor,
      Color unSelectedColor,
      double iconWidth,
      {String iconAssetName = '',
      double? describeSize,
      Color? describeColor,
      Function(SelectorItem selectorItem, int position)? callBack}) {
    List<Widget> children = [];
    for (int i = 0; i < list.length; i++) {
      SelectorItem item = list[i];
      Widget widget = InkWell(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              TextStyle(fontSize: textSize, color: textColor),
                        ),
                        if (item.describe.isNotEmpty)
                          Text(
                            item.describe,
                            maxLines: 1,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: describeSize ?? textSize,
                                color: describeColor ?? textColor),
                          ),
                      ],
                    ),
                    iconAssetName.isNotEmpty
                        ? Image(
                            fit: BoxFit.fitWidth,
                            width: iconWidth,
                            alignment: Alignment.center,
                            color: item.check ? selectColor : unSelectedColor,
                            image: AssetImage(iconAssetName))
                        : Icon(Icons.check_circle,
                            color: item.check ? selectColor : unSelectedColor)
                  ],
                ),
              ),
              if (i < list.length - 1)
                Divider(
                  height: 1,
                  color: lineColor,
                )
            ],
          ),
        ),
        onTap: () {
          callBack?.call(item, i);
        },
      );
      children.add(widget);
    }
    return children;
  }
}
