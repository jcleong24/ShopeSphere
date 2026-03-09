import 'package:flutter/material.dart';
import 'package:flutter_user_ecomm_app/core/theme/style_manager.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final double elevation;
  final Color iconColor;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingPressed;
  final Widget? trailingWidget;
  final Color backgroundColor;

  const CustomAppBar(
      {super.key,
      required this.title,
      this.onBackPressed,
      this.elevation = 0.0,
      this.iconColor = Colors.black,
      this.trailingIcon,
      this.onTrailingPressed,
      this.trailingWidget,
      this.backgroundColor = Colors.transparent});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 10);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 10, 10, 0.0),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: elevation,
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: 0.35), // background color
              shape: BoxShape.circle, // circular background
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
              color: iconColor,
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          ),
        ),
        title: Text(title, style: StyleManager.headingSemiMedium()),
        actions: [
          trailingWidget ??
              IconButton(
                icon: Icon(trailingIcon),
                color: iconColor,
                onPressed: onTrailingPressed,
              ),
        ],
      ),
    );
  }
}
