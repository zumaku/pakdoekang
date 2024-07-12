import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';

class MyBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  MyBottomNavbar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        boxShadow: [MyShadow.shadowTwo()],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              switch (index) {
                case 0:
                case 3:
                case 4:
                  onItemTapped(index);
                  break;
                case 1:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Text('Search Bottom Sheet'),
                        ),
                      );
                    },
                  );
                  break;
                case 2:
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        color: Colors.white,
                        child: Center(
                          child: Text('ADD Bottom Sheet'),
                        ),
                      );
                    },
                  );
                  break;
              }
            },
            backgroundColor: Colors.white,
            selectedItemColor: MyColor.brand,
            unselectedItemColor: MyColor.base2,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
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
                icon: selectedIndex == 0
                    ? MyIcon.calenderFill(color: MyColor.brand)
                    : MyIcon.calenderAlt(color: MyColor.base),
                label: 'Hari Ini',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 1
                    ? MyIcon.searchFill(color: MyColor.brand)
                    : MyIcon.searchAlt(color: MyColor.base),
                label: 'Cari',
              ),
              BottomNavigationBarItem(
                icon: MyIcon.addTransactionFill(color: MyColor.base),
                label: 'Tambah',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex - 1 == 2
                    ? MyIcon.archiveFill(color: MyColor.brand)
                    : MyIcon.archiveAlt(color: MyColor.base),
                label: 'Arsip',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex - 1 == 3
                    ? MyIcon.pieChartFill(color: MyColor.brand)
                    : MyIcon.pieChartAlt(color: MyColor.base),
                label: 'Masukan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
