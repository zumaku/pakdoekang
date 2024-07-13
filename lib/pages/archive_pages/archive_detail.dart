import 'package:flutter/material.dart';

class ArchiveDetail extends StatelessWidget {
  final int selectedMonth;
  const ArchiveDetail({
    required this.selectedMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Archiver Detail"));
  }
}
