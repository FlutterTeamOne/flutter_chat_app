part of 'new_user_widget.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    super.key,
    required this.text,
    required this.validator,
    required this.controller,
    this.obscureText = false,
    this.inputFormatters,
    required this.maxLength,
    this.icons,
    this.suffixOnTap,
  });

  final String text;
  final String? Function(String?) validator;
  final bool? obscureText;
  final RegExp? inputFormatters;
  final int maxLength;
  final IconData? icons;
  final Function()? suffixOnTap;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      inputFormatters: [
        FilteringTextInputFormatter.allow(inputFormatters ?? ''),
      ],
      maxLength: maxLength,
      decoration: InputDecoration(
        isDense: true,
        labelText: text,
        labelStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).hintColor,
              fontSize: 14,
            ),
        counterText: '',
        suffixIcon: IconButton(icon: Icon(icons), onPressed: suffixOnTap),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Theme.of(context).errorColor),
        ),
      ),
    );
  }
}
