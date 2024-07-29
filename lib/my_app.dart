import 'package:expense_tracker/presentation/pages/splash_screen.dart';
import 'package:expense_tracker/presentation/theme/theme.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExpenseProvider()..prepareData(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(context),
          home: const SplashScreen(),
        );
      },
    );
  }
}
