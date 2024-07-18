import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';

class MyText {
  // Text Style
  static TextStyle getHeadingOneStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 93,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle getHeadingTwoStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 58,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle getHeadingThreeStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 46,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
    );
  }

  static TextStyle getHeadingFourStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 30,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
    );
  }

  static TextStyle getHeadingFiveStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 23,
      fontWeight: FontWeight.w500, // Medium
      color: color,
    );
  }

  static TextStyle getHeadingSixStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 19,
      fontWeight: FontWeight.w500, // Medium
      color: color,
    );
  }

  static TextStyle getSubTitleOneStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 15,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
    );
  }

  static TextStyle getSubTitleTwoStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'WorkSans',
      fontSize: 13,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
    );
  }

  static TextStyle getParagraphOneStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15,
      fontWeight: FontWeight.normal, // Regular
      color: color,
    );
  }

  static TextStyle getParagraphTwoStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 13,
      fontWeight: FontWeight.normal, // Regular
      color: color,
    );
  }

  static TextStyle getButtonOneStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15,
      fontWeight: FontWeight.bold,
      color: color,
      height: 24 / 15, // Lineheight 24
    );
  }

  static TextStyle getButtonTwoStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 13,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
      height: 24 / 13, // Lineheight 24
    );
  }

  static TextStyle getButtonThreeStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
      height: 24 / 12, // Lineheight 24
    );
  }

  static TextStyle getLabelOneStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 15,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
    );
  }

  static TextStyle getLabelTwoStyle({Color color = MyColor.base5}) {
    return TextStyle(
      fontFamily: 'Montserrat',
      fontSize: 12,
      fontWeight: FontWeight.w600, // SemiBold
      color: color,
      height: 16 / 10, // Lineheight 16
    );
  }

  // Text Widget
  static Widget headingOne(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingOneStyle(color: color),
    );
  }

  static Widget headingTwo(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingTwoStyle(color: color),
    );
  }

  static Widget headingThree(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingThreeStyle(color: color),
    );
  }

  static Widget headingFour(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingFourStyle(color: color),
    );
  }

  static Widget headingFive(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingFiveStyle(color: color),
    );
  }

  static Widget headingSix(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getHeadingSixStyle(color: color),
    );
  }

  static Widget subTitleOne(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getSubTitleOneStyle(color: color),
    );
  }

  static Widget subTitleTwo(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getSubTitleTwoStyle(color: color),
    );
  }

  static Widget paragraphOne(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getParagraphOneStyle(color: color),
    );
  }

  static Widget paragraphTwo(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getParagraphTwoStyle(color: color),
    );
  }

  static Widget buttonOne(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getButtonOneStyle(color: color),
    );
  }

  static Widget buttonTwo(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getButtonTwoStyle(color: color),
    );
  }

  static Widget buttonThree(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getButtonThreeStyle(color: color),
    );
  }

  static Widget labelOne(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getLabelOneStyle(color: color),
    );
  }

  static Widget labelTwo(String text,
      {Color color = MyColor.base5, TextAlign textAlign = TextAlign.center}) {
    return Text(
      text,
      textAlign: textAlign,
      style: getLabelTwoStyle(color: color),
    );
  }
}
