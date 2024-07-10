import 'package:flutter/material.dart';
import 'package:pakdoekang/pages/archive_page.dart';
import 'package:pakdoekang/pages/overview_page.dart';
import 'package:pakdoekang/pages/today_page.dart';
import 'package:pakdoekang/widgets/my_bottom_navbar.dart';
import 'package:pakdoekang/widgets/my_app_bar.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        bottomNavigationBar: MyBottomNavbar(
          selectedIndex: _selectedIndex,
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}
