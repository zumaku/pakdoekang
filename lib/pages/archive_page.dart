import 'package:flutter/material.dart';
import 'package:pakdoekang/pages/archive_pages/archive_detail.dart';
import 'package:pakdoekang/pages/archive_pages/archive_months.dart';
import 'package:pakdoekang/services/navbar_provider.dart';
import 'package:provider/provider.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  int _selectedMonth = DateTime.now().month;

  void _onItemTapped(bool isArchiveMonths, int selectedMonth) {
    final navigationProvider = Provider.of<NavigationProvider>(context, listen: false);
    setState(() {
      _selectedMonth = selectedMonth;
    });
    navigationProvider.setArchiveState(isArchiveMonths);
  }

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    bool _isArchiveMonths = navigationProvider.isArchiveMonths;

    return Scaffold(
      body: _isArchiveMonths
          ? ArchiveMonthsPage(onItemTapped: _onItemTapped, isArchiveMonts: _isArchiveMonths)
          : ArchiveDetail(selectedMonth: _selectedMonth),
    );
  }
}
