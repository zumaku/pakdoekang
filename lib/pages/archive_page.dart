import 'package:flutter/material.dart';
import 'package:pakdoekang/pages/archive_pages/archive_detail.dart';
import 'package:pakdoekang/pages/archive_pages/archive_months.dart';

class ArchivePage extends StatefulWidget {
  @override
  _ArchivePageState createState() => _ArchivePageState();
}

class _ArchivePageState extends State<ArchivePage> {
  bool _isArchiveMonts = true;
  int _selectedMonth = DateTime.now().month;

  void _onItemTapped(bool isArchiveMonts, int selectedMonth) {
    setState(() {
      _isArchiveMonts = isArchiveMonts;
      _selectedMonth = selectedMonth;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isArchiveMonts
          ? ArchiveMonthsPage(onItemTapped: _onItemTapped, isArchiveMonts: _isArchiveMonts)
          : ArchiveDetail(selectedMonth: _selectedMonth),
    );
  }
}
