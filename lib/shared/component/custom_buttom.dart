import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.radius,
    this.width,
    this.height,
  }) : super(key: key);

  final String title;
  final Function() onPressed;
  final Color? backgroundColor;
  final double? radius;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: context.propHeight(15)),
      minWidth: width ?? double.infinity,
      height: height,
      color: backgroundColor ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius ?? 16),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: context.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}
