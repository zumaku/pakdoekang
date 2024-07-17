import 'package:flutter/material.dart';
import 'package:pakdoekang/dummy_data/dummy_provider.dart';
import 'package:pakdoekang/pages/account_page.dart';
import 'package:pakdoekang/pages/archive_page.dart';
import 'package:pakdoekang/pages/analysis_page.dart';
import 'package:pakdoekang/pages/login_page.dart';
import 'package:pakdoekang/pages/search_page.dart';
import 'package:pakdoekang/pages/today_page.dart';
import 'package:pakdoekang/services/app_service_provider.dart';
import 'package:pakdoekang/services/auth_service_provider.dart';
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
        ChangeNotifierProvider(create: (_) => AuthServiceProvider()),
        ChangeNotifierProvider(
            create: (context) => FirestoreServiceProvider(context)),
        ChangeNotifierProvider(create: (_) => AppServiceProvider()),
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
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServiceProvider>(context);

    if (authProvider.user == null) {
      return LoginPage();
    } else {
      return MainPage();
    }
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final authProvider = Provider.of<AuthServiceProvider>(context);
    final user = authProvider.user;

    final List<Widget> pages = [
      TodayPage(),
      SearchPages(),
      Container(), // Just empty page
      ArchivePage(),
      AnalysisPage(),
    ];

    return Scaffold(
      appBar: MyAppBar(
        selectedIndex: navigationProvider.selectedIndex,
        profileImage: user?.photoURL ??
            'https://media.newyorker.com/photos/59095bb86552fa0be682d9d0/master/w_1920,c_limit/Monkey-Selfie.jpg',
      ),
      body: navigationProvider.isAccountPage
          ? AccountPage()
          : pages[navigationProvider.selectedIndex],
      bottomNavigationBar: MyBottomNavbar(),
    );
  }
}
