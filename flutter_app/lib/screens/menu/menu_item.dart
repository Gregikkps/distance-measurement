import 'package:distance_measurement_app/resources/drawer_config.dart';
import 'package:distance_measurement_app/resources/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final MenuClass? item;
  final Widget? widthBox;
  final TextStyle? style;
  final void Function(int)? callback;
  final bool? selected;

  const MenuItem({
    Key? key,
    this.item,
    this.widthBox,
    this.style,
    this.callback,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => callback!(item!.index),
      style: TextButton.styleFrom(
        backgroundColor: selected! ? AppColors.blueGreyColor : AppColors.transparent,

      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            item!.icon,
            color: style!.color,
          ),
          widthBox!,
          Expanded(
            child: Text(
              item!.title,
              style: style,
            ),
          )
        ],
      ),
    );
  }
}

