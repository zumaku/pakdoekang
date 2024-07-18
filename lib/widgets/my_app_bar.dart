import 'package:flutter/material.dart';
import 'package:pakdoekang/services/navbar_provider.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final int selectedIndex;
  final String profileImage;

  const MyAppBar({
    Key? key,
    required this.selectedIndex,
    required this.profileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    String pageName = _getPageTitle(selectedIndex);

    return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight + 17),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10), // Padding x 20
          color: Colors.white,
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: MyText.headingFive(pageName),
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                padding: EdgeInsets.all(10),
                icon: CircleAvatar(
                  backgroundImage: NetworkImage(profileImage),
                ),
                onPressed: () {
                  navigationProvider.setIsAccountPageState(true);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPageTitle(int index) {
    switch (index) {
      case 0:
        return 'Hari Ini';
      case 1:
        return 'Cari';
      case 2:
        return 'Tambah';
      case 3:
        return 'Arsip';
      case 4:
        return 'Analisis';
      case 5:
        return 'Profile';
      default:
        return 'Halaman Tidak Ditemukan';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  static AppBarTheme get theme {
    return const AppBarTheme(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      backgroundColor: Colors.white, // Warna latar belakang AppBar
      titleTextStyle: TextStyle(
        color: MyColor.brand, // Warna teks judul
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: MyColor.brand, // Warna ikon AppBar
      ),
    );
  }
}
