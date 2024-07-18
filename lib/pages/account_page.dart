import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakdoekang/services/app_service_provider.dart';
import 'package:pakdoekang/services/auth_service_provider.dart';
import 'package:pakdoekang/services/navbar_provider.dart';
import 'package:pakdoekang/widgets/buttons/reguler_btn.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:skeleton_loader/skeleton_loader.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void _launchUrlAndExit(String url) async {
    try {
      final uri = Uri.parse(url);
      if (!await canLaunchUrl(uri)) {
        throw Exception('Could not launch $url');
      }
      await launchUrl(uri, mode: LaunchMode.externalApplication);
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthServiceProvider>(context);
    final user = authProvider.user;
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return SingleChildScrollView(
      child: SafeArea(
        minimum: EdgeInsets.all(10),
        child: Column(
          children: [
            // Profile
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.all(3),
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      Column(
                        children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: MyColor.brand2,
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: AssetImage("assets/images/banner.png"),
                                  fit: BoxFit.cover,
                                )),
                          ),
                          SizedBox(height: 50),
                          MyText.headingSix("${user?.displayName}"),
                          MyText.paragraphTwo("${user?.email}"),
                        ],
                      ),
                      Positioned(
                        top: 40,
                        left: 0,
                        right: 0,
                        child: Center(
                          child: ClipOval(
                            child: Image.network(
                              user?.photoURL ??
                                  'https://media.newyorker.com/photos/59095bb86552fa0be682d9d0/master/w_1920,c_limit/Monkey-Selfie.jpg',
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Buttons
            StreamBuilder<String?>(
              stream: Provider.of<AppServiceProvider>(context).aboutLinksStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Column(
                    children: [
                      SkeletonLoader(
                        builder: Container(
                          height: 45,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: MyColor.base5,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: 4,
                        period: Duration(seconds: 1),
                      ),
                      SizedBox(height: 40),
                      SkeletonLoader(
                        builder: Container(
                          height: 45,
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: MyColor.base5,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        items: 1,
                        period: Duration(seconds: 1),
                      ),
                    ],
                  );
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (!snapshot.hasData || snapshot.data == null) {
                  return Text('No data available');
                }

                final Map<String, dynamic> links = snapshot.data != null
                    ? Map<String, dynamic>.from(jsonDecode(snapshot.data!))
                    : {};

                return Column(
                  children: [
                    links['dokumentasi'] != ''
                        ? MyRegulerBtn.mediumBase(
                            text: "Dokumentasi",
                            onTap: () =>
                                _launchUrlAndExit(links['dokumentasi']),
                          )
                        : MyRegulerBtn.disableMedium(
                            text: "Dokumentasi",
                            textColor: MyColor.disable1,
                            backgroundColor: MyColor.disable4),
                    SizedBox(height: 15),
                    links['saran'] != ''
                        ? MyRegulerBtn.mediumBase(
                            text: "Beri Saran",
                            onTap: () => _launchUrlAndExit(links['saran']),
                          )
                        : MyRegulerBtn.disableMedium(
                            text: "Beri Saran",
                            textColor: MyColor.disable1,
                            backgroundColor: MyColor.disable4),
                    SizedBox(height: 15),
                    links['faqs'] != ''
                        ? MyRegulerBtn.mediumBase(
                            text: "FAQS",
                            onTap: () => _launchUrlAndExit(links['faqs']),
                          )
                        : MyRegulerBtn.disableMedium(
                            text: "FAQS",
                            textColor: MyColor.disable1,
                            backgroundColor: MyColor.disable4),
                    SizedBox(height: 15),
                    links['traktir_developer'] != ''
                        ? MyRegulerBtn.mediumBase(
                            text: "Traktir Developer",
                            onTap: () =>
                                _launchUrlAndExit(links['traktir_developer']),
                          )
                        : MyRegulerBtn.disableMedium(
                            text: "Traktir Developer",
                            textColor: MyColor.disable1,
                            backgroundColor: MyColor.disable4),
                  ],
                );
              },
            ),

            SizedBox(height: 40),
            MyRegulerBtn.mediumBrand(
                text: "Logout",
                onTap: () {
                  authProvider.signOut();
                  navigationProvider.setIsAccountPageState(false);
                }),
            SizedBox(height: 10),
            MyText.paragraphTwo("Pakdoekang v1.0"),
          ],
        ),
      ),
    );
  }
}
