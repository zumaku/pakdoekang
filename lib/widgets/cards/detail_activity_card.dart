import 'package:flutter/material.dart';
import 'package:pakdoekang/controllers/currency_format.dart';
import 'package:pakdoekang/controllers/date_converter.dart';
import 'package:pakdoekang/services/api_service.dart';
import 'package:pakdoekang/services/api_service_provider.dart';
import 'package:pakdoekang/services/firestore_service_provider.dart';
import 'package:pakdoekang/widgets/buttons/category_btn.dart';
import 'package:pakdoekang/widgets/buttons/icon_button.dart';
import 'package:pakdoekang/widgets/form/edit_activity.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';
import 'package:provider/provider.dart';

class DetailActivityCard extends StatelessWidget {
  final String id_activity;
  final String activity;
  final double amount;
  final List<dynamic> categories;
  final DateTime date;
  final bool isSpend;
  final String notes;

  DetailActivityCard({
    super.key,
    required this.id_activity,
    required this.activity,
    required this.amount,
    required this.categories,
    required this.date,
    required this.isSpend,
    required this.notes,
  });

  @override
  Widget build(BuildContext context) {
    double padding = 16;

    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          MyIcon.calenderFill(),
                          SizedBox(width: 10),
                          MyText.buttonTwo(DateConverter.convert(date))
                        ],
                      ),
                      Row(
                        children: [
                          MyIconButton.smallBrand(
                              onTap: () {
                                Navigator.pop(context);
                                showModalBottomSheet(
                                  context: context,
                                  // isScrollControlled: true,
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.vertical(
                                  //     top: Radius.circular(15),
                                  //   ),
                                  // ),
                                  builder: (context) {
                                    return EditActivityForm(
                                      id_activity: id_activity,
                                      initialActivity: activity,
                                      initialAmount: amount,
                                      initialCategories: categories,
                                      initialDate: date,
                                      initialIsSpend: isSpend,
                                      initialNotes: notes,
                                    );
                                  },
                                );
                              },
                              icon: MyIcon.editFill()),
                          SizedBox(
                            width: 8,
                          ),
                          MyIconButton.smallBase(
                              onTap: () async {
                                final provider =
                                    Provider.of<ApiServiceProvider>(
                                        context,
                                        listen: false);
                                try {
                                  await provider.deleteTransaksi(id_activity);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Transaksi berhasil dihapus',
                                        style: MyText.getButtonOneStyle(
                                            color: MyColor.base5),
                                      ),
                                      backgroundColor: MyColor.brand2,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                  Navigator.pop(
                                      context); // Close the modal bottom sheet
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Gagal menghapus data! Error: $e',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      backgroundColor: MyColor.base,
                                      behavior: SnackBarBehavior.floating,
                                    ),
                                  );
                                }
                              },
                              icon: MyIcon.trashFill())
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  MyText.headingSix(activity, textAlign: TextAlign.start),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText.paragraphOne(
                          CurrencyFormat.convertToIdr(amount, 0)),
                      isSpend ? MyIcon.rupiahUpFill() : MyIcon.rupiahDownFill(),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 14),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 16),
                      ...categories.map((category) {
                        return Row(
                          children: [
                            DetailActivityCard.getIconButton(category),
                            SizedBox(width: 16),
                          ],
                        );
                      }).toList(),
                    ])),
            SizedBox(height: 14),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 1,
                      color: MyColor.base,
                    ),
                    SizedBox(height: 14),
                    MyText.paragraphOne(notes, textAlign: TextAlign.start)
                  ]),
            ),
          ],
        ));
  }

  static Widget getIconButton(String category) {
    switch (category.toLowerCase()) {
      case 'makan':
        return MyCategoryButton.makan(isSelected: true);
      case 'kuliah':
        return MyCategoryButton.kuliah(isSelected: true);
      case 'hiburan':
        return MyCategoryButton.hiburan(isSelected: true);
      case 'utang':
        return MyCategoryButton.utang(isSelected: true);
      case 'belanja':
        return MyCategoryButton.belanja(isSelected: true);
      case 'tabungan':
        return MyCategoryButton.tabungan(isSelected: true);
      case 'iuran':
        return MyCategoryButton.iuran(isSelected: true);
      case 'gajian':
        return MyCategoryButton.gajian(isSelected: true);
      case 'hadiah':
        return MyCategoryButton.hadiah(isSelected: true);
      default:
        return MyCategoryButton.makan(isSelected: true);
    }
  }
}
