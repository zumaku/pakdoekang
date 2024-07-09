import 'package:flutter/material.dart';
import 'package:pakdoekang/pages/archive_page.dart';
import 'package:pakdoekang/pages/overview_page.dart';
import 'package:pakdoekang/pages/today_page.dart';
import 'package:pakdoekang/widgets/bottom_navbar.dart';
import 'package:pakdoekang/widgets/my_app_bar.dart';
import 'package:pakdoekang/widgets/my_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      TodayPage(),
      ArchivePage(),
      OverviewPage(),
    ];

    return MaterialApp(
      theme: ThemeData(
        appBarTheme: MyAppBar.theme,
        primaryColor: MyColor.brand,
        scaffoldBackgroundColor: MyColor.base1,
      ),
      home: Scaffold(
        appBar: MyAppBar(
          selectedIndex: _selectedIndex,
          profileImage:
              'assets/images/ProfilePicture.png', // Path gambar profil lokal
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
