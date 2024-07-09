import 'package:flutter/material.dart';
import 'my_colors.dart';
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
      child: MyIcon.TicketAlt(color: iconColor),
    );
  }

  static Widget Kuliah({
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
      child: MyIcon.Book(color: iconColor),
    );
  }

  static Widget Makan({
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
      child: MyIcon.Pizza(color: iconColor),
    );
  }

  static Widget Belanja({
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
      child: MyIcon.BagAlt(color: iconColor),
    );
  }

  static Widget Hiburan({
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
      child: MyIcon.Gamepad(color: iconColor),
    );
  }

  static Widget Utang({
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
      child: MyIcon.Paper(color: iconColor),
    );
  }

  static Widget Gajian({
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
      child: MyIcon.Wallet(color: iconColor),
    );
  }

  static Widget Tabungan({
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
      child: MyIcon.Creditcard(color: iconColor),
    );
  }

  static Widget Hadiah({
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
