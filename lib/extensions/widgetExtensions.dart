import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension Widgetextensions on Widget {
  Widget expanded({int flex = 1}) {
    return Expanded(flex: flex, child: this);
  }

  Center center() {
    return Center(child: this);
  }

  GestureDetector onTap({required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: this,
    );
  }

  Padding padding({EdgeInsetsGeometry padding = const EdgeInsets.all(8.0)}) {
    return Padding(padding: padding, child: this);
  }

  Padding horizontalPadding({double padding = 8.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Padding verticalPadding({double padding = 8.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Padding leftPadding(double left) {
    return Padding(
      padding: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Padding rightPadding(double right) {
    return Padding(
      padding: EdgeInsets.only(right: right),
      child: this,
    );
  }

  Padding topPadding(double top) {
    return Padding(
      padding: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Padding bottomPadding(double bottom) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }

  Container horizonalMargin(double horizontal) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontal),
      child: this,
    );
  }

  Container verticalMargin(double vertical) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: vertical),
      child: this,
    );
  }

  Container leftMargin(double left) {
    return Container(
      margin: EdgeInsets.only(left: left),
      child: this,
    );
  }

  Container rightMargin(double right) {
    return Container(
      margin: EdgeInsets.only(right: right),
      child: this,
    );
  }

  Container topMargin(double top) {
    return Container(
      margin: EdgeInsets.only(top: top),
      child: this,
    );
  }

  Container bottomMargin(double bottom) {
    return Container(
      margin: EdgeInsets.only(bottom: bottom),
      child: this,
    );
  }
}
