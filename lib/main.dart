import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_category_icons.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/my_text.dart';
import 'widgets/my_colors.dart';

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
              Container(
                width: 32,
                height: 32,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColor.brand,
                ),
                child: MyIcon.TicketAlt(color: MyColor.base5),
              ),
              MyCategoryIcon.Hadiah(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText.headingFive("Ini Heading 1", color: MyColor.brand),
                  MyText.headingSix("Ini Heading 2"),
                  MyText.paragraphOne("Ini Paragraph 1"),
                  MyText.buttonOne("Ini Button 1", color: MyColor.brand),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
