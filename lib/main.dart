import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/icons.dart';
import 'widgets/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Color Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Montserrat Regular',
                style: TextStyle(fontFamily: 'Montserrat'),
              ),
              Text(
                'Montserrat Bold',
                style: TextStyle(
                    fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
              ),
              Text(
                'WorkSans Regular',
                style: TextStyle(fontFamily: 'WorkSans'),
              ),
              Text(
                'WorkSans Bold',
                style: TextStyle(
                    fontFamily: 'WorkSans', fontWeight: FontWeight.bold),
              ),
              Text(
                'Brand Color',
                style: TextStyle(color: MyColor.brand),
              ),
              Text(
                'Base Color',
                style: TextStyle(color: MyColor.base),
              ),
              Container(
                  child: MyIcon.ArchiveFill(
                color: MyColor.base3,
                size: 48,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
