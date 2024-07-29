import 'package:expense_tracker/presentation/theme/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData theme(BuildContext context) => ThemeData(
      fontFamily: 'Poppins',
      useMaterial3: true,
      primaryColor: Palette.pinkMocha,
      disabledColor: Palette.shadowDark,
      hintColor: Palette.subTextDark,
      cardColor: Palette.backgroundDark,
      scaffoldBackgroundColor: Palette.backgroundDark,
      colorScheme:
          const ColorScheme.dark().copyWith(primary: Palette.pinkMocha),
      textTheme: TextTheme(
        displayLarge: Theme.of(context).textTheme.displayLarge?.copyWith(
              color: Palette.textDark,
            ),
        displayMedium: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: Palette.textDark,
            ),
        displaySmall: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: Palette.textDark,
            ),
        headlineMedium: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Palette.textDark,
            ),
        headlineSmall: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Palette.textDark,
            ),
        titleLarge: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Palette.textDark,
            ),
        titleMedium: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Palette.textDark,
            ),
        titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Palette.textDark,
            ),
        bodyLarge: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Palette.textDark,
            ),
        bodyMedium: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Palette.textDark,
            ),
        bodySmall: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Palette.textDark,
            ),
        labelLarge: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: Palette.textDark,
            ),
        labelSmall: Theme.of(context).textTheme.labelSmall?.copyWith(
              letterSpacing: 0.25,
              color: Palette.textDark,
            ),
      ),
      appBarTheme: const AppBarTheme().copyWith(
        titleTextStyle: Theme.of(context).textTheme.bodyLarge,
        iconTheme: const IconThemeData(color: Palette.pinkMocha),
        color: Palette.backgroundDark,
        systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: Colors.transparent,
        ),
        surfaceTintColor: Palette.backgroundDark,
        shadowColor: Palette.shadowDark,
      ),
      brightness: Brightness.dark,
      iconTheme: const IconThemeData(color: Palette.primary),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
