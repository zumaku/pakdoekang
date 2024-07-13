import 'package:flutter/material.dart';
import 'package:pakdoekang/pages/archive_page.dart';
import 'package:pakdoekang/pages/insight_page.dart';
import 'package:pakdoekang/pages/today_page.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
      Container(), // Placeholder for your other pages
      Container(), // Placeholder for your other pages
      ArchivePage(), 
      InsightPage(),
    ];

    return Scaffold(
      appBar: MyAppBar(
        selectedIndex: _selectedIndex,
        profileImage: 'assets/images/ProfilePicture.png',
      ),
      body: pages[_selectedIndex],
      bottomNavigationBar: MyBottomNavbar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
