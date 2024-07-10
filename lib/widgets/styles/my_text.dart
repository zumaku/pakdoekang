import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';

class MyText {
  static Widget headingOne(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 93,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Widget headingTwo(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 58,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }

  static Widget headingThree(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 46,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
      ),
    );
  }

  static Widget headingFour(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 30,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
      ),
    );
  }

  static Widget headingFive(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 23,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      ),
    );
  }

  static Widget headingSix(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 19,
        fontWeight: FontWeight.w500, // Medium
        color: color,
      ),
    );
  }

  static Widget subTitleOne(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 15,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
      ),
    );
  }

  static Widget subTitleTwo(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'WorkSans',
        fontSize: 13,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
      ),
    );
  }

  static Widget paragraphOne(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15,
        fontWeight: FontWeight.normal, // Regular
        color: color,
      ),
    );
  }

  static Widget paragraphTwo(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 13,
        fontWeight: FontWeight.normal, // Regular
        color: color,
      ),
    );
  }

  static Widget buttonOne(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: color,
        height: 24 / 15, // Lineheight 24
      ),
    );
  }

  static Widget buttonTwo(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 13,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
        height: 24 / 13, // Lineheight 24
      ),
    );
  }

  static Widget buttonThree(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
        height: 24 / 12, // Lineheight 24
      ),
    );
  }

  static Widget labelOne(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 15,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
      ),
    );
  }

  static Widget labelTwo(String text, {Color color = MyColor.base5}) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Montserrat',
        fontSize: 12,
        fontWeight: FontWeight.w600, // SemiBold
        color: color,
        height: 16 / 10, // Lineheight 16
      ),
    );
  }
}
