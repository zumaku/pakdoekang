import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/my_shadow.dart';

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
      PageToday(),
      PageArchive(),
      PageOverview(),
    ];

    return MaterialApp(
      theme: ThemeData(
        primaryColor: MyColor.brand, // Warna utama aplikasi
        scaffoldBackgroundColor: MyColor.base1, // Warna latar belakang scaffold
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Navbar Example'),
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            boxShadow: [
              MyShadow.shadowTwo(),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: Colors.white,
              fixedColor: MyColor.brand,
              unselectedItemColor: MyColor.base2,
              type: BottomNavigationBarType.fixed,
              elevation: 10,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: _selectedIndex == 0
                      ? MyIcon.calenderFill(
                          color: _selectedIndex == 0
                              ? MyColor.brand
                              : MyColor.base)
                      : MyIcon.calenderAlt(),
                  label: 'Hari Ini',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 1
                      ? MyIcon.archiveFill(
                          color: _selectedIndex == 1
                              ? MyColor.brand
                              : MyColor.base)
                      : MyIcon.archiveAlt(),
                  label: 'Arsip',
                ),
                BottomNavigationBarItem(
                  icon: _selectedIndex == 2
                      ? MyIcon.pieChartFill(
                          color: _selectedIndex == 2
                              ? MyColor.brand
                              : MyColor.base)
                      : MyIcon.pieChartAlt(),
                  label: 'Overview',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PageToday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Hari Ini'),
    );
  }
}

class PageArchive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Arsip'),
    );
  }
}

class PageOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Overview'),
    );
  }
}
