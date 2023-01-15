import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.lableText,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    required this.inputFormatters,
    this.maxLength = 20,
  });

  final String lableText;
  final Function(String?) validator;
  final bool? obscureText;
  final RegExp? inputFormatters;
  final int? maxLength;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final isActive = obscureText == true ? ValueNotifier<bool>(true) : null;
    ValueNotifier<bool> a = ValueNotifier<bool>(true);

    return ValueListenableBuilder(
      valueListenable: isActive ?? a,
      builder: (context, value, child) => TextFormField(
        controller: controller,
        validator: (value) => validator(value),
        obscureText: isActive != null ? isActive.value : false,
        inputFormatters: [
          FilteringTextInputFormatter.allow(inputFormatters ?? '')
        ],
        maxLength: maxLength,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          isDense: true,
          labelText: lableText,
          labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 14,
              ),
          counterText: '',
          suffixIcon: isActive != null
              ? IconButton(
                  icon: Icon(isActive.value == true
                      ? Icons.visibility_off_rounded
                      : Icons.visibility_rounded),
                  onPressed: () {
                    if (isActive.value == true) {
                      isActive.value = false;
                    } else {
                      isActive.value = true;
                    }
                  })
              : null,
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Theme.of(context).errorColor),
          ),
        ),
      ),
    );
  }
}
