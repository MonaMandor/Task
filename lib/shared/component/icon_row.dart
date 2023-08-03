import 'package:flutter/material.dart';
import 'package:posts_app/shared/constans/context_extentions.dart';

import '../constans/assets_manger.dart';

class IconRow extends StatelessWidget {
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onGooglePressed;
  final VoidCallback? onApplePressed;

  IconRow({
    this.onFacebookPressed,
    this.onGooglePressed,
    this.onApplePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconButton(
          icon: Image.asset(AssetManger.facebock),
          onPressed: onFacebookPressed,
        ),
        SizedBox(width: 60),
        _buildIconButton(
          icon: Image.asset(AssetManger.google),
          onPressed: onGooglePressed,
        ),
        SizedBox(width: 60),
        _buildIconButton(
          icon: Image.asset(AssetManger.apple),
          onPressed: onApplePressed,
        ),
      ],
    );
  }

  Widget _buildIconButton({required Widget icon, VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Center(child: icon),
      ),
    );
  }
}
