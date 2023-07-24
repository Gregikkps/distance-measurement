import 'package:flutter/material.dart';

@immutable
class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  // Zdefiniuj niestandardowe style tekstów dla różnych rozmiarów
  final TextStyle bodySmall;
  final TextStyle bodyMedium;
  final TextStyle bodyLarge;
  final TextStyle headlineSmall;
  final TextStyle headlineMedium;
  final TextStyle headlineLarge;
  final TextStyle titleSmall;
  final TextStyle titleMedium;
  final TextStyle titleLarge;
  final TextStyle displaySmall;
  final TextStyle displayMedium;
  final TextStyle displayLarge;
  final TextStyle labelSmall;
  final TextStyle labelMedium;
  final TextStyle labelLarge;

  // Konstruktor do zainicjowania stylów tekstów
  const TextThemeExtension._({
    required this.bodySmall,
    required this.bodyMedium,
    required this.bodyLarge,
    required this.headlineSmall,
    required this.headlineMedium,
    required this.headlineLarge,
    required this.titleSmall,
    required this.titleMedium,
    required this.titleLarge,
    required this.displaySmall,
    required this.displayMedium,
    required this.displayLarge,
    required this.labelSmall,
    required this.labelMedium,
    required this.labelLarge,
  });

  // Fabryczna metoda do tworzenia instancji klasy TextThemeExtension
  factory TextThemeExtension() {
    const String mainFontFamily = 'RaleWay';
    return const TextThemeExtension._(
      bodySmall: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 18.0,
      ),
      bodyMedium: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 20.0,
      ),
      bodyLarge: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 28.0,
      ),
      headlineSmall: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 18.0,
      ),
      headlineMedium: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 20.0,
      ),
      headlineLarge: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 22.0,
      ),
      titleSmall: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 18.0,
      ),
      titleMedium: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 20.0,
      ),
      titleLarge: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 22.0,
      ),
      displaySmall: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 18.0,
      ),
      displayMedium: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 20.0,
      ),
      displayLarge: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 40.0,
      ),
      labelSmall: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 18.0,
      ),
      labelMedium: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 20.0,
      ),
      labelLarge: TextStyle(
        fontFamily: mainFontFamily,
        fontSize: 22.0,
      ),
    );
  }

  @override
  TextThemeExtension copyWith() {
    return TextThemeExtension._(
      bodySmall: bodySmall,
      bodyMedium: bodyMedium,
      bodyLarge: bodyLarge,
      headlineSmall: headlineSmall,
      headlineMedium: headlineMedium,
      headlineLarge: headlineLarge,
      titleSmall: titleSmall,
      titleMedium: titleMedium,
      titleLarge: titleLarge,
      displaySmall: displaySmall,
      displayMedium: displayMedium,
      displayLarge: displayLarge,
      labelSmall: labelSmall,
      labelMedium: labelMedium,
      labelLarge: labelLarge,
    );
  }

  @override
  TextThemeExtension lerp(
    covariant ThemeExtension<TextThemeExtension>? other,
    double t,
  ) {
    if (other == null || other is! TextThemeExtension) {
      return copyWith();
    }

    return TextThemeExtension._(
      bodySmall: TextStyle.lerp(bodySmall, other.bodySmall, t)!,
      bodyMedium: TextStyle.lerp(bodyMedium, other.bodyMedium, t)!,
      bodyLarge: TextStyle.lerp(bodyLarge, other.bodyLarge, t)!,
      headlineSmall: TextStyle.lerp(headlineSmall, other.headlineSmall, t)!,
      headlineMedium: TextStyle.lerp(headlineMedium, other.headlineMedium, t)!,
      headlineLarge: TextStyle.lerp(headlineLarge, other.headlineLarge, t)!,
      titleSmall: TextStyle.lerp(titleSmall, other.titleSmall, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      titleLarge: TextStyle.lerp(titleLarge, other.titleLarge, t)!,
      displaySmall: TextStyle.lerp(displaySmall, other.displaySmall, t)!,
      displayMedium: TextStyle.lerp(displayMedium, other.displayMedium, t)!,
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      labelSmall: TextStyle.lerp(labelSmall, other.labelSmall, t)!,
      labelMedium: TextStyle.lerp(labelMedium, other.labelMedium, t)!,
      labelLarge: TextStyle.lerp(labelLarge, other.labelLarge, t)!,
    );
  }
}
