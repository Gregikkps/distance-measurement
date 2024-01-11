import 'dart:ui';

import 'package:golden_toolkit/golden_toolkit.dart';

class Config {
  static List<Device> devices = [
    Device.phone.copyWith(
      name: 'custom_phone',
      size: const Size(720, 1560),
    ),
    Device.iphone11,
    Device.tabletLandscape,
    Device.tabletPortrait
  ];
}
