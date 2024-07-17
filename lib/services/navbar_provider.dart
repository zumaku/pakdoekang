import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool _isArchiveMonths = true;
  bool _isAccountPage = false;

  int get selectedIndex => _selectedIndex;
  bool get isArchiveMonths => _isArchiveMonths;
  bool get isAccountPage => _isAccountPage;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setArchiveState(bool isArchiveMonths) {
    _isArchiveMonths = isArchiveMonths;
    notifyListeners();
  }

  void setIsAccountPageState(bool isAccountPage) {
    _isAccountPage = isAccountPage;
    notifyListeners();
  }

  void resetArchiveState() {
    _isArchiveMonths = true;
    notifyListeners();
  }
}
