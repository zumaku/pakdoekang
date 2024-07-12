import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class InputFormField extends StatefulWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle; // Added for custom text style
  final FocusNode? focusNode; // Added focus node

  const InputFormField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.inputFormatters,
    this.textStyle, // Added for custom text style
    this.focusNode, // Added focus node
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();

  static Widget textInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      textStyle: textStyle, // Pass custom text style
    );
  }

  static Widget numberInput({
    required String hintText,
    required void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator ?? _defaultNumberValidator,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: textStyle, // Pass custom text style
    );
  }

  static Widget longTextInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textStyle: textStyle, // Pass custom text style
    );
  }

  static String? _defaultNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan anga';
    }
    final n = num.tryParse(value);
    if (n == null) {
      return 'Masukkan angka yang valid';
    }
    return null;
  }

  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan tekt';
    }
    return null; // Menghapus validasi hanya huruf alfabet
  }
}

class _InputFormFieldState extends State<InputFormField> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 0),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            width: 3.0,
            color: _isFocused ? Colors.green : Colors.transparent,
          ),
        ),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          setState(() {
            _isFocused = hasFocus;
          });
        },
        child: TextFormField(
          decoration: InputDecoration(
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
          style: widget.textStyle ??
              MyText.getParagraphOneStyle(), // Use custom or default text style
          onChanged: widget.onChanged,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          inputFormatters: widget.inputFormatters,
        ),
      ),
    );
  }
}
