import 'package:flutter/material.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';
import 'package:posts_app/shared/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Icon? suffixIcon;
  final double? height;
  final double? width;
  final bool? disabled;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final String? Function(String? value, String? errorText)? validator;

  const CustomTextField({
    super.key,
    this.disabled,
    this.hintText,
    this.height,
    this.width,
    this.controller,
    this.obscureText,
    this.keyboardType,
    this.errorText,
    this.validator,
    this.suffixIcon,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(
        vertical: context.propHeight(5),
      ),
      decoration: BoxDecoration(
        //shaddow effect for bottom
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        enabled: disabled ?? true,
        controller: controller,
        obscureText: obscureText ?? false,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: context.propWidth(20),
            vertical: context.propHeight(20),
          ),
          hintText: hintText,
          hintStyle: context.textTheme.bodyLarge?.copyWith(
            color: AppColors.primaryColor.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              width: 30,
              color: Colors.blue,
            ),
          ),
          filled: true,
          fillColor: Colors.grey[300],
          labelText: labelText,
        ),
      ),
    );
  }
}
