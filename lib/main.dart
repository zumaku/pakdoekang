import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/my_shadow.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Widget> pages = [
    PageToday(),
    PageArchive(),
    PageOverview(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    // Ketika item navbar dipilih, ubah _selectedIndex sesuai dengan index yang dipilih
    _selectedIndex = index;
    // Lakukan navigasi atau perubahan halaman sesuai dengan kebutuhan aplikasi
    // Contoh: Navigator.push(...) atau setState(...)
  }

  @override
  Widget build(BuildContext context) {
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
                    topLeft: Radius.circular(30)),
                boxShadow: [
                  // BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                  MyShadow.shadowTwo()
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
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: MyIcon.calenderFill(color: MyColor.brand),
                      label: 'Hari Ini',
                    ),
                    BottomNavigationBarItem(
                      icon: MyIcon.archiveAlt(),
                      label: 'Arsip',
                    ),
                    BottomNavigationBarItem(
                      icon: MyIcon.pieChartAlt(),
                      label: 'Overview',
                    ),
                  ],
                ),
              ))
          // bottomNavigationBar: BottomNavigationBar(
          // currentIndex: _selectedIndex,
          // onTap: _onItemTapped,
          // backgroundColor: Colors.white,
          // fixedColor: MyColor.brand,
          // unselectedItemColor: MyColor.base2,
          // type: BottomNavigationBarType.fixed,
          // elevation: 10,
          // selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          // unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          //   items: [
          // BottomNavigationBarItem(
          //   icon: MyIcon.calenderFill(color: MyColor.brand),
          //   label: 'Hari Ini',
          // ),
          // BottomNavigationBarItem(
          //   icon: MyIcon.archiveAlt(),
          //   label: 'Arsip',
          // ),
          // BottomNavigationBarItem(
          //   icon: MyIcon.pieChartAlt(),
          //   label: 'Overview',
          // ),
          //   ],
          // ),
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
