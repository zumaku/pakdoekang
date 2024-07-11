import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class MyCategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Widget? icon;
  final bool isSelected;

  MyCategoryButton({
    Key? key,
    required this.onTap,
    this.text = "Icon",
    this.icon,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = MyColor.brand;
    Color borderColor = MyColor.brand;

    if (!isSelected) {
      color = Colors.transparent;
      borderColor = MyColor.base5;
    }

    return GestureDetector(
      onTap: onTap,
      child: IntrinsicWidth(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          decoration: BoxDecoration(
              color: color,
              border: Border.all(
                color: borderColor,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(50)),
          child: Row(
            children: [
              icon!,
              SizedBox(
                width: 10,
              ),
              MyText.buttonThree(text)
            ],
          ),
        ),
      ),
    );
  }

  static MyCategoryButton kuliah({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Kuliah",
      icon: MyCategoryIcon.kuliah(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton makan({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Makan",
      icon: MyCategoryIcon.makan(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton iuran({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Iuran",
      icon: MyCategoryIcon.iuran(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton belanja({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Belanja",
      icon: MyCategoryIcon.belanja(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton hiburan({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Hiburan",
      icon: MyCategoryIcon.hiburan(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton utang({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Utang",
      icon: MyCategoryIcon.utang(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton gajian({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Gajian",
      icon: MyCategoryIcon.gajian(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton tabungan({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Tabungan",
      icon: MyCategoryIcon.tabungan(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }

  static MyCategoryButton hadiah({
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    Color bgColor = MyColor.brand;
    if (!isSelected) {
      bgColor = Colors.transparent;
    }

    return MyCategoryButton(
      text: "Hadiah",
      icon: MyCategoryIcon.hadiah(backgroundColor: bgColor),
      isSelected: isSelected,
      onTap: onTap,
    );
  }
}
