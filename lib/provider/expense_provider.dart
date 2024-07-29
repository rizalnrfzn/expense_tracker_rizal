import 'package:expense_tracker/database/hive_database.dart';
import 'package:expense_tracker/helpers/utils.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class ExpenseProvider extends ChangeNotifier {
  List<Expense> overallExpense = [];

  List<Expense> get expenses => overallExpense;

  final db = HiveDatabase();

  void prepareData() {
    if (db.readData().isNotEmpty) {
      overallExpense = db.readData();
      notifyListeners();
    }
  }

  void addNewExpense(Expense newExpense) {
    overallExpense.add(newExpense);
    db.saveData(overallExpense);
    notifyListeners();
  }

  void deleteExpense(Expense expense) {
    overallExpense.remove(expense);
    db.saveData(overallExpense);
    notifyListeners();
  }

  String getDayName(DateTime date) {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return 'Invalid Day';
    }
  }

  DateTime startOfWeekDate(DateTime date) {
    late DateTime startofWeek;

    final today = DateTime.now();

    for (var i = 0; i < 7; i++) {
      if (getDayName(today.subtract(Duration(days: i))) == 'Monday') {
        startofWeek = today.subtract(Duration(days: i));
        break;
      }
    }

    return startofWeek;
  }

  Map<String, double> calculateDailyExpanseSummary() {
    Map<String, double> dailyExpanseSummary = {};

    for (var expense in overallExpense) {
      String date = Utils.convertedDateTimeToString(expense.date);

      if (dailyExpanseSummary.containsKey(date)) {
        dailyExpanseSummary[date] = dailyExpanseSummary[date]! + expense.amount;
      } else {
        dailyExpanseSummary.addAll({date: expense.amount});
      }
    }

    return dailyExpanseSummary;
  }

  List<Expense> getAllExpenseOnThisWeek() {
    final List<Expense> expenseOnThisWeek = [];
    final startOfWeek = startOfWeekDate(DateTime.now());
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    for (var expense in overallExpense) {
      if (expense.date.isAfter(startOfWeek) &&
          expense.date.isBefore(endOfWeek)) {
        expenseOnThisWeek.add(expense);
      }
    }
    return expenseOnThisWeek;
  }

  double getTotalAmountThisWeek() {
    double totalAmount = 0;

    final startOfWeek = startOfWeekDate(DateTime.now());
    final endOfWeek = startOfWeek.add(const Duration(days: 6));

    for (var expense in overallExpense) {
      if (expense.date.isAfter(startOfWeek) &&
          expense.date.isBefore(endOfWeek)) {
        totalAmount += expense.amount;
      }
    }

    return totalAmount;
  }
}
