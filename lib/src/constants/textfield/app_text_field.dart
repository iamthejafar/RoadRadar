import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/app/theme/colors.dart';






class AppTextField extends StatelessWidget {
  const AppTextField({
    this.validator,
    this.controller,
    this.hintText,
    this.errorText,
    this.inputFormatters,
    this.keyboardType,
    this.suffixIconConstraints,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.maxlines,
    this.onChanged,
    this.prefixText,
    this.showBorder = true,
    this.onSubmit,
    this.prefixIcon,
    super.key,  this.obsecure = false, this.enabledBorder, this.disabledBorder, this.border,
  });

  final String? hintText;
  final String? prefixText;
  final bool showBorder;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final BoxConstraints? suffixIconConstraints;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? border;

  final bool readOnly;
  final void Function()? onTap;
  final int? maxlines;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;

  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TextFormField(
      style: textTheme.displayMedium!.copyWith(fontWeight: FontWeight.w600),
      obscureText: obsecure,
      onTap: onTap,
      onChanged: onChanged,
      readOnly: readOnly,
      maxLines: maxlines,
      controller: controller,
      validator: validator,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: grey,
        border: border,
        enabledBorder: enabledBorder,
        disabledBorder: disabledBorder,
        errorText: errorText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
    );
  }
}



