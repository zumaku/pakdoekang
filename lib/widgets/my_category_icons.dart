import 'package:flutter/material.dart';
import 'styles/my_colors.dart';
import 'my_icon.dart';

class MyCategoryIcon {
  static const double defaultWidth = 32.0;
  static const double defaultHeight = 32.0;
  static const Color defaultBackgroundColor = MyColor.brand;
  static const Color defaultIconColor = MyColor.base5;

  static Widget Iuran({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.ticketAlt(color: iconColor),
    );
  }

  static Widget kuliah({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.book(color: iconColor),
    );
  }

  static Widget makan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.pizza(color: iconColor),
    );
  }

  static Widget belanja({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.bagAlt(color: iconColor),
    );
  }

  static Widget hiburan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.gamepad(color: iconColor),
    );
  }

  static Widget utang({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.paper(color: iconColor),
    );
  }

  static Widget gajian({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.wallet(color: iconColor),
    );
  }

  static Widget tabungan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.creditcard(color: iconColor),
    );
  }

  static Widget hadiah({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
      ),
      child: MyIcon.giftAlt(color: iconColor),
    );
  }
}
