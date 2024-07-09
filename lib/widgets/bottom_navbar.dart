import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  BottomNavbar({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            offset: Offset(0, -4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          backgroundColor: Colors.white,
          selectedItemColor: MyColor.brand,
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
              icon: selectedIndex == 0
                  ? MyIcon.calenderFill(
                      color: selectedIndex == 0 ? MyColor.brand : MyColor.base)
                  : MyIcon.calenderAlt(),
              label: 'Hari Ini',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 1
                  ? MyIcon.archiveFill(
                      color: selectedIndex == 1 ? MyColor.brand : MyColor.base)
                  : MyIcon.archiveAlt(),
              label: 'Arsip',
            ),
            BottomNavigationBarItem(
              icon: selectedIndex == 2
                  ? MyIcon.pieChartFill(
                      color: selectedIndex == 2 ? MyColor.brand : MyColor.base)
                  : MyIcon.pieChartAlt(),
              label: 'Overview',
            ),
          ],
        ),
      ),
    );
  }
}
