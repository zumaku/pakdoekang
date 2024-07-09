import 'package:flutter/material.dart';

class MyShadow {
  static BoxShadow shadowOne() {
    return BoxShadow(
      color: Color(0x29000000), // #000000 16% opacity
      offset: Offset(0, 4),
      blurRadius: 8,
    );
  }

  static BoxShadow shadowTwo() {
    return BoxShadow(
      color: Color(0x29000000), // #000000 16% opacity
      offset: Offset(0, 8),
      blurRadius: 16,
    );
  }

  static BoxShadow shadowThree() {
    return BoxShadow(
      color: Color(0x29000000), // #000000 16% opacity
      offset: Offset(0, 16),
      blurRadius: 32,
    );
  }

  static BoxShadow shadowFour() {
    return BoxShadow(
      color: Color(0x29000000), // #000000 16% opacity
      offset: Offset(0, 32),
      blurRadius: 72,
    );
  }
}
