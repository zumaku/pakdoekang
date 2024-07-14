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
  final String? initialValue; // Added initial value

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
    this.initialValue, // Added initial value
  }) : super(key: key);

  @override
  _InputFormFieldState createState() => _InputFormFieldState();

  static Widget textInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
    String? initialValue, // Added initial value
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      textStyle: textStyle, // Pass custom text style
      initialValue: initialValue, // Pass initial value
    );
  }

  static Widget numberInput({
    required String hintText,
    required void Function(String)? onChanged,
    String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
    String? initialValue, // Added initial value
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator ?? _defaultNumberValidator,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textStyle: textStyle, // Pass custom text style
      initialValue: initialValue, // Pass initial value
    );
  }

  static Widget longTextInput({
    required String hintText,
    required void Function(String)? onChanged,
    required String? Function(String?)? validator,
    TextStyle? textStyle, // Added for custom text style
    String? initialValue, // Added initial value
  }) {
    return InputFormField(
      hintText: hintText,
      onChanged: onChanged,
      validator: validator,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      textStyle: textStyle, // Pass custom text style
      initialValue: initialValue, // Pass initial value
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
  late TextEditingController _controller; // Added TextEditingController

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue); // Initialize controller with initial value
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
          controller: _controller, // Use the controller
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
