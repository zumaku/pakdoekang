import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pakdoekang/widgets/my_icon.dart';
import 'package:pakdoekang/widgets/styles/my_colors.dart';
import 'package:pakdoekang/widgets/styles/my_text.dart';

class InputFormField extends StatefulWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? textStyle;
  final FocusNode? focusNode;
  final String? initialValue;
  final Widget? prefixIcon; // Added for prefix icon
  final Widget? suffixIcon; // Added for suffix icon

  const InputFormField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.inputFormatters,
    this.textStyle,
    this.focusNode,
    this.initialValue,
    this.prefixIcon, // Added for prefix icon
    this.suffixIcon, // Added for suffix icon
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();

  static Widget textInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle,
    String? initialValue,
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      textStyle: textStyle,
      initialValue: initialValue,
    );
  }

  static Widget numberInput({
    required String hintText,
    required void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextStyle? textStyle,
    String? initialValue,
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator ?? _defaultNumberValidator,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: textStyle,
      initialValue: initialValue,
    );
  }

  static Widget longTextInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle,
    String? initialValue,
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textStyle: textStyle,
      initialValue: initialValue,
    );
  }

  static Widget searchInput({
    required String hintText,
    required void Function(String)? onChanged,
    TextStyle? textStyle,
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      textStyle: textStyle,
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MyIcon.searchAlt(),
      ),
      // suffixIcon: Icon(Icons.clear),
      suffixIcon: MyIcon.close_ring(),
    );
  }

  static String? _defaultNumberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan angka';
    }
    final n = num.tryParse(value);
    if (n == null) {
      return 'Masukkan angka yang valid';
    }
    return null;
  }

  static String? textValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Masukkan teks';
    }
    return null;
  }
}

class _InputFormFieldState extends State<InputFormField> {
  bool _isFocused = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
          controller: _controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: widget.prefixIcon, // Add prefix icon
            suffixIcon: widget.suffixIcon != null
                ? IconButton(
                    icon: widget.suffixIcon!,
                    onPressed: () {
                      _controller.clear();
                      if (widget.onChanged != null) widget.onChanged!('');
                    },
                  )
                : null,
            border: InputBorder.none,
          ),
          style: widget.textStyle ?? MyText.getParagraphOneStyle(),
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
