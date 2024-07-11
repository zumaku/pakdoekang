import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class RegulerBtn extends StatelessWidget {
  final VoidCallback? onTap;
  final String text;
  final Widget? icon;
  final Color color;
  final int textType;
  final Color textColor;
  final Color borderColor;
  final double borderRadius;
  final bool isDisable;

  const RegulerBtn({
    Key? key,
    required this.text,
    this.icon,
    this.onTap,
    this.color = MyColor.brand,
    this.textType = 1,
    this.textColor = MyColor.base5,
    this.borderColor = Colors.transparent,
    this.borderRadius = 5.0,
    this.isDisable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWidget;
    switch (textType) {
      case 1:
        textWidget = MyText.buttonOne(text);
        break;
      case 2:
        textWidget = MyText.buttonTwo(text);
        break;
      case 3:
        textWidget = MyText.buttonThree(text);
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
            )
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
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
  static RegulerBtn largeBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 1,
      textColor: MyColor.base5,
      borderColor: Colors.transparent,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn mediumBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 2,
      textColor: MyColor.base5,
      borderColor: Colors.transparent,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn smallBrand({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      textType: 3,
      textColor: MyColor.base5,
      borderColor: Colors.transparent,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn largeBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 1,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn mediumBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 2,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn smallBase({
    required String text,
    VoidCallback? onTap,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      textType: 3,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }
  
  static RegulerBtn disableLarge({
    required String text,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: Colors.transparent,
      textType: 1,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn disableMedium({
    required String text,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: Colors.transparent,
      textType: 2,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }

  static RegulerBtn disableSmall({
    required String text,
    Widget? icon,
  }) {
    return RegulerBtn(
      text: text,
      icon: icon,
      onTap: null,
      color: Colors.transparent,
      textType: 3,
      textColor: MyColor.base5,
      borderColor: MyColor.base5,
      borderRadius: 5.0,
    );
  }
}
