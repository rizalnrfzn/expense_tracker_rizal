import 'package:expense_tracker/my_app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  await Hive.openBox('expense_database');

  runApp(const MyApp());
}
