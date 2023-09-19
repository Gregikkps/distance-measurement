#!/bin/sh

flutter clean
flutter pub get
flutter pub run flutter_launcher_icons
flutter clean
flutter pub get