import 'package:flutter/material.dart';
import 'package:pakdoekang/dummy_data/dummy_provider.dart';
import 'package:pakdoekang/pages/archive_page.dart';
import 'package:pakdoekang/pages/insight_page.dart';
import 'package:pakdoekang/pages/search_page.dart';
import 'package:pakdoekang/pages/today_page.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/services/navbar_provider.dart';
import 'package:pakdoekang/widgets/my_bottom_navbar.dart';
import 'package:pakdoekang/widgets/my_app_bar.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FirestoreServiceProvider()),
        ChangeNotifierProvider(create: (_) => DummyProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pakdiekang",
      theme: ThemeData(
        appBarTheme: MyAppBar.theme,
        scaffoldBackgroundColor: MyColor.base1,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: MyColor.brand,
          background: MyColor.base5,
          onBackground: Colors.grey,
        ),
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final List<Widget> pages = [
      TodayPage(),
      SearchPages(),
      Container(), // Just empty page
      ArchivePage(),
      InsightPage(),
    ];

    return Scaffold(
      appBar: MyAppBar(
        selectedIndex: navigationProvider.selectedIndex,
        profileImage: 'assets/images/ProfilePicture.png',
      ),
      body: pages[navigationProvider.selectedIndex],
      bottomNavigationBar: MyBottomNavbar(),
    );
  }
}
