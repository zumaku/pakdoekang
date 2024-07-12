import 'package:flutter/material.dart';
import 'package:pakdoekang/controllers/date_converter.dart';
import 'package:pakdoekang/services/firestore.dart';
import 'package:pakdoekang/widgets/buttons/icon_button.dart';
import 'package:pakdoekang/widgets/buttons/reguler_btn.dart';
import 'package:pakdoekang/widgets/form/category_selector.dart';
import 'package:pakdoekang/widgets/form/input_form.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class ActivityForm extends StatefulWidget {
  final void Function(String, double, List<dynamic>, DateTime, bool, String)
      onSubmit;

  ActivityForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final _formKey = GlobalKey<FormState>();
  String _activity = '';
  double _amount = 0.0;
  List<dynamic> _selectedCategories = [];
  DateTime _selectedDate = DateTime.now();
  bool _isSpend = false;
  String _notes = '';

  void _toggleSpend() {
    setState(() {
      _isSpend = !_isSpend;
    });
  }

  void _handleCategoryTap(dynamic category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
      print(_selectedCategories);
    });
  }

  void _selectDateTime() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: MyColor.brand,
              background: Colors.white,
              onBackground: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }

    if (picked != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDate),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDate = DateTime(
            picked.year,
            picked.month,
            picked.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(
        _activity,
        _amount,
        _selectedCategories,
        _selectedDate,
        _isSpend,
        _notes,
      );

      FirestoreService firestoreService = FirestoreService();

      // Tambahkan kode untuk mengirim data ke Firestore di sini
      await firestoreService
          .addTransaksi(
        _activity,
        _amount,
        _isSpend,
        _selectedDate,
        _selectedCategories,
        _notes,
      )
          .then((_) {
        print('Transaction added to Firestore! ');
      }).catchError((error) {
        print('Failed to add transaction: $error');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  InputFormField.textInput(
                    hintText: 'Aktifitas',
                    onChanged: (value) {
                      _activity = value;
                    },
                    validator: InputFormField.textValidator,
                    textStyle: MyText.getHeadingSixStyle(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputFormField.numberInput(
                          hintText: 'Jumlah',
                          onChanged: (value) {
                            _amount = double.parse(value);
                          },
                        ),
                      ),
                      SizedBox(width: 8),
                      MyIconButton.smallBase(
                        onTap: () => _toggleSpend(),
                        icon: _isSpend
                            ? MyIcon.rupiahDownFill()
                            : MyIcon.rupiahUpFill(),
                      ),
                    ],
                  ),
                  InputFormField.longTextInput(
                    hintText: 'Catatan',
                    onChanged: (value) {
                      _notes = value;
                    },
                    validator: null,
                  ),
                  SizedBox(height: 14),
                ],
              ),
            ),
            CategorySelector(
              selectedCategories: _selectedCategories
                  .cast<String>(), // Cast kembali jika diperlukan
              onCategoryTap: _handleCategoryTap,
            ),
            Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 14),
                    Container(
                      height: 1,
                      color: MyColor.base,
                    ),
                    SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MyRegulerBtn.smallBase(
                          text: DateConverter.convert(_selectedDate),
                          icon: MyIcon.calenderFill(),
                          onTap: () {
                            _selectDateTime();
                          },
                        ),
                        _activity.isEmpty ||
                                _amount == 0.0 ||
                                _selectedCategories.isEmpty
                            ? MyIconButton.smallDisable(
                                icon: MyIcon.send_horFill(color: MyColor.base2),
                              )
                            : MyIconButton.smallBrand(
                                onTap: () {
                                  _submitForm();
                                },
                                icon: MyIcon.send_horFill(),
                              ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
