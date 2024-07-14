import 'package:flutter/material.dart';
import 'package:pakdoekang/services/navbar_provider.dart';
import 'package:pakdoekang/widgets/form/add_activity.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_shadow.dart';
import 'package:provider/provider.dart';

class MyBottomNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final int selectedIndex = navigationProvider.selectedIndex;

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
                case 1:
                case 4:
                  navigationProvider.setSelectedIndex(index);
                  break;
                case 3:
                  navigationProvider.resetArchiveState();
                  navigationProvider.setSelectedIndex(index);
                case 2:
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: ActivityForm(
                          onSubmit: (activity, amount, categories, date,
                              isSpend, notes) {
                            Navigator.pop(context);
                          },
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
                icon: selectedIndex == 3
                    ? MyIcon.archiveFill(color: MyColor.brand)
                    : MyIcon.archiveAlt(color: MyColor.base),
                label: 'Arsip',
              ),
              BottomNavigationBarItem(
                icon: selectedIndex == 4
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
