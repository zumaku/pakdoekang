import 'package:flutter/foundation.dart';

class NavigationProvider with ChangeNotifier {
  int _selectedIndex = 0;
  bool _isArchiveMonths = true;

  int get selectedIndex => _selectedIndex;
  bool get isArchiveMonths => _isArchiveMonths;

  void setSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setArchiveState(bool isArchiveMonths) {
    _isArchiveMonths = isArchiveMonths;
    notifyListeners();
  }

  void resetArchiveState() {
    _isArchiveMonths = true;
    notifyListeners();
  }
}
