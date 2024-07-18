import 'package:flutter/material.dart';
import 'package:pakdoekang/services/app_service.dart';

class AppServiceProvider with ChangeNotifier {
  final AppService _appService = AppService();

  AppService get appService => _appService;

  Stream<String?> get aboutLinksStream => _appService.getAboutLinks;

  // Example function to fetch data using the stream
  void listenToAboutLinks() {
    aboutLinksStream.listen((data) {
      // Handle the incoming data
      // print(data);
      notifyListeners();
    });
  }
}
