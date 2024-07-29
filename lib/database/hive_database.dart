import 'package:expense_tracker/model/expense.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveDatabase {
  final _myBOx = Hive.box('expense_database');

  void saveData(List<Expense> allExpense) {
    List<List<dynamic>> allExpneseFormatted = [];
    for (var expense in allExpense) {
      List<dynamic> expenseFormatted = [
        expense.name,
        expense.amount,
        expense.date,
      ];
      allExpneseFormatted.add(expenseFormatted);
    }
    _myBOx.put('all_expenses', allExpneseFormatted);
  }

  List<Expense> readData() {
    List<Expense> allExpenses = [];
    List<dynamic> allExpensesFormatted = _myBOx.get('all_expenses') ?? [];
    for (var expense in allExpensesFormatted) {
      Expense expenseFormatted = Expense(
        name: expense[0],
        amount: expense[1],
        date: expense[2],
      );
      allExpenses.add(expenseFormatted);
    }
    return allExpenses;
  }
}
