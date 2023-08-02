import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:distance_measurement_app/resources/tools/platform_mode_checker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget>? actions;

  const CustomAppBar({super.key, required this.title, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    return AppBar(
      title: title,
      centerTitle: true,
      elevation: 0.0,
      actions: actions,
      leading: IconButton(
        onPressed: () => ZoomDrawer.of(context)?.open(),
        icon: const Icon(Icons.menu),
      ),
      titleTextStyle: textTheme.displayMedium.copyWith(
        color: PlatformModeChecker.isDarkMode(context)
            ? AppColors.whiteTextColor
            : AppColors.blackTextColor,
      ),
    );
  }
}
