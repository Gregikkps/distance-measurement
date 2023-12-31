import 'package:distance_measurement_app/provider/menu/menu_state.dart';
import 'package:distance_measurement_app/resources/app_spacing/app_spacing.dart';
import 'package:distance_measurement_app/resources/drawer_config.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:distance_measurement_app/resources/theme/text_style.dart';
import 'package:distance_measurement_app/screens/menu/menu.dart';
import 'package:distance_measurement_app/screens/menu/menu_item.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MenuScreenView extends StatelessWidget {
  final MenuScreenState state;
  const MenuScreenView(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<TextThemeExtension>()!;
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ListView(
            padding: AppSpacing.standardPadding,
            shrinkWrap: true,
            children: <Widget>[
              FutureBuilder<PackageInfo>(
                future: PackageInfo.fromPlatform(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final packageInfo = snapshot.data!;
                    return Text(
                      "${appLocalizations.menuView_version} ${packageInfo.version}",
                      style: textTheme.displaySmall,
                    );
                  } else {
                    return const LinearProgressIndicator();
                  }
                },
              ),
              Text(
                appLocalizations.menuView_title,
                style: textTheme.displayLarge,
              ),
              AppSpacing.smallSizedBox,
              Selector<MenuState, int>(
                selector: (_, provider) => provider.currentPage,
                builder: (BuildContext context, int index, Widget? child) {
                  final textTheme = Theme.of(context).textTheme;

                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ...DrawerConfig.createMainMenu(context)
                          .map(
                            (item) => MenuItem(
                              key: Key(item.index.toString()),
                              item: item,
                              callback: state.widget.callback,
                              widthBox: DrawerConfig.widthItemBox,
                              style: textTheme.titleLarge,
                              selected: index == item.index,
                            ),
                          )
                          .toList()
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
