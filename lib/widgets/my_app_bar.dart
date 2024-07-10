import 'package:flutter/material.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

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
    String pageName = _getPageTitle(selectedIndex);

    //     borderRadius: BorderRadius.only(
    //   topRight: Radius.circular(30),
    //   topLeft: Radius.circular(30),
    // ),

    return PreferredSize(
      preferredSize: Size.fromHeight(
          kToolbarHeight + 17), // Tambahkan padding y + tinggi default appbar
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10), // Padding x 20
          color: Colors.white,
          child: AppBar(
            backgroundColor: Colors.white,
            title: MyText.headingFive(pageName),
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: MyIcon.searchAlt(),
                onPressed: () {
                  // Aksi saat tombol pencarian ditekan
                  // Misalnya, buka layar pencarian
                },
              ),
              IconButton(
                padding: EdgeInsets.all(10),
                icon: CircleAvatar(
                  backgroundImage: AssetImage(profileImage),
                ),
                onPressed: () {
                  // Aksi saat foto profil ditekan
                  // Misalnya, buka profil pengguna
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
        return 'Arsip';
      case 2:
        return 'Overview';
      default:
        return 'Halaman Tidak Ditemukan';
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  static AppBarTheme get theme {
    return const AppBarTheme(
      elevation: 8, // Atur nilai elevation secara global
      // shadowColor: MyColor.base1, // Atur warna bayangan
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
