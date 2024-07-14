import 'package:flutter/material.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/cards/activity_card.dart';
import 'package:pakdoekang/widgets/form/input_form.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';
import 'package:pakdoekang/services/firestore.dart';

class SearchPages extends StatefulWidget {
  @override
  _SearchPagesState createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  TextEditingController _searchController = TextEditingController();
  String _searchKeyword = "";

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(value) {
    setState(() {
      _searchKeyword = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: InputFormField.searchInput(
            hintText: 'Cari apa?',
            onChanged: (value) {
              _onSearchChanged(value);
            },
            textStyle: MyText.getParagraphOneStyle(),
          ),
        ),
        Expanded(
          child: StreamBuilder<List<Transaksi>>(
            stream: Provider.of<FirestoreServiceProvider>(context)
                .searchTransaksi(_searchKeyword),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error loading transactions'));
              }
              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No transactions found :('));
              }

              final List<Transaksi> transactions = snapshot.data!;

              return ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  Transaksi transaction = transactions[index];
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: ActivityCard(
                        id_activity: transaction.id,
                        activity: transaction.aktifitas,
                        amount: transaction.jumlah,
                        date: transaction.tanggal,
                        categories: transaction.kategori,
                        isSpend: transaction.isPengeluaran,
                        notes: transaction.catatan,
                      ));
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
