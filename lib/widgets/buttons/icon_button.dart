import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';

class MyIconButton extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget? icon;
  final Color color;
  final Color borderColor;
  final double borderRadius;
  final EdgeInsets padding;
  final double width;
  final double height;

  const MyIconButton({
    Key? key,
    required this.onTap,
    this.icon,
    this.color = MyColor.brand,
    this.borderColor = MyColor.brand,
    this.borderRadius = 6.0,
    this.padding = const EdgeInsets.all(10),
    this.width = 400,
    this.height = 40,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),
        padding: padding,
        child: Center(
          child: icon,
        ),
      ),
    );
  }

  static MyIconButton smallBrand({
    required VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      borderColor: MyColor.brand,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 36,
      height: 36,
    );
  }

  static MyIconButton largeBrand({
    required VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: onTap,
      color: MyColor.brand,
      borderColor: MyColor.brand,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 54,
      height: 54,
    );
  }

  static MyIconButton smallBase({
    required VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: onTap,
      color: Colors.transparent,
      borderColor: MyColor.base5,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 36,
      height: 36,
    );
  }

  static MyIconButton largeBase({
    required VoidCallback? onTap,
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: onTap,
      color: MyColor.base1,
      borderColor: MyColor.base1,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 54,
      height: 54,
    );
  }

  static MyIconButton smallDisable({
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: null,
      color: MyColor.base1,
      borderColor: MyColor.base1,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 36,
      height: 36,
    );
  }

  static MyIconButton largeDisable({
    Widget? icon,
  }) {
    return MyIconButton(
      icon: icon,
      onTap: null,
      color: MyColor.base1,
      borderColor: Colors.transparent,
      borderRadius: 6.0,
      padding: const EdgeInsets.all(6),
      width: 54,
      height: 54,
    );
  }
}
