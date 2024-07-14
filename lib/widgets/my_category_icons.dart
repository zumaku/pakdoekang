import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'styles/my_colors.dart';
import 'my_icon.dart';

class MyCategoryIcon {
  static const double defaultWidth = 32.0;
  static const double defaultHeight = 32.0;
  static const Color defaultBackgroundColor = MyColor.brand;
  static const Color defaultIconColor = MyColor.base5;
  static const Color defaultBorderColor = MyColor.brand;

  static Widget iuran({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.ticketAlt(color: iconColor),
    );
  }

  static Widget kuliah({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.book(color: iconColor),
    );
  }

  static Widget makan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.pizza(color: iconColor),
    );
  }

  static Widget belanja({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.bagAlt(color: iconColor),
    );
  }

  static Widget hiburan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.gamepad(color: iconColor),
    );
  }

  static Widget utang({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.paper(color: iconColor),
    );
  }

  static Widget gajian({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.wallet(color: iconColor),
    );
  }

  static Widget tabungan({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.creditcard(color: iconColor),
    );
  }

  static Widget hadiah({
    double width = defaultWidth,
    double height = defaultHeight,
    Color backgroundColor = defaultBackgroundColor,
    Color iconColor = defaultIconColor,
    Color borderColor = defaultBorderColor,
  }) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: backgroundColor,
        border: Border.all(
          width: 1,
          color: borderColor,
        ),
      ),
      child: MyIcon.giftAlt(color: iconColor),
    );
  }

  static Widget getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'makan':
        return MyCategoryIcon.makan(borderColor: MyColor.brand4);
      case 'kuliah':
        return MyCategoryIcon.kuliah(borderColor: MyColor.brand4);
      case 'hiburan':
        return MyCategoryIcon.hiburan(borderColor: MyColor.brand4);
      case 'utang':
        return MyCategoryIcon.utang(borderColor: MyColor.brand4);
      case 'belanja':
        return MyCategoryIcon.belanja(borderColor: MyColor.brand4);
      case 'tabungan':
        return MyCategoryIcon.tabungan(borderColor: MyColor.brand4);
      case 'iuran':
        return MyCategoryIcon.iuran(borderColor: MyColor.brand4);
      case 'gajian':
        return MyCategoryIcon.gajian(borderColor: MyColor.brand4);
      case 'hadiah':
        return MyCategoryIcon.hadiah(borderColor: MyColor.brand4);
      default:
        return Container(
          width: 32,
          height: 32,
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.transparent,
            border: Border.all(
              color: MyColor.base,
              width: 1.5,
            ),
          ),
          child: MyText.buttonThree("${category}+"),
        );
    }
  }
}
