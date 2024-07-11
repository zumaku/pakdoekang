import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class MyRegulerBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Widget? icon;
  final Color color;
  final int textType;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;

  const MyRegulerBtn({
    Key? key,
    required this.text,
    this.icon,
    this.onTap,
    this.color = MyColor.brand,
    this.textType = 1,
    this.textColor = MyColor.base5,
    this.borderColor = Colors.transparent,
    this.borderRadius = 6.0,
    this.padding = const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWidget;
    switch (textType) {
      case 1:
        textWidget = MyText.buttonOne(text, color: textColor);
        break;
      case 2:
        textWidget = MyText.buttonTwo(text, color: textColor);
        break;
      case 3:
        textWidget = MyText.buttonThree(text, color: textColor);
        break;
      default:
        textWidget = MyText.buttonOne(text); // Default case
    }

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                color: borderColor,
                width: 1.5,
              )),
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (icon != null) ...[
                icon!,
                SizedBox(width: 10.0),
              ],
              textWidget,
            ],
          ),
        ),
      ),
    );
  }

  // Static methods for different button styles
  static MyRegulerBtn largeBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 1,
      textColor: MyColor.base5,
      borderColor: MyColor.brand,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    );
  }

  static MyRegulerBtn mediumBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 2,
      textColor: MyColor.base5,
      borderColor: MyColor.brand,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
    );
  }

  static MyRegulerBtn smallBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 3,
      textColor: MyColor.base5,
      borderColor: MyColor.brand,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
    );
  }

  static MyRegulerBtn largeBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 1,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    );
  }

  static MyRegulerBtn mediumBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 2,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
    );
  }

  static MyRegulerBtn smallBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 3,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
    );
  }

  static MyRegulerBtn disableLarge({
    required String text,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: MyColor.base1,
      textType: 1,
      textColor: MyColor.base2,
      borderColor: MyColor.base1,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
    );
  }

  static MyRegulerBtn disableMedium({
    required String text,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: MyColor.base1,
      textType: 2,
      textColor: MyColor.base2,
      borderColor: MyColor.base1,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 14.0),
    );
  }

  static MyRegulerBtn disableSmall({
    required String text,
    Widget? icon,
  }) {
    return MyRegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: MyColor.base1,
      textType: 3,
      textColor: MyColor.base2,
      borderColor: MyColor.base1,
      borderRadius: 6.0,
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
    );
  }
}
