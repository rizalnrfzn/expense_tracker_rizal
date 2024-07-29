import 'package:expense_tracker/helpers/utils.dart';
import 'package:expense_tracker/presentation/theme/palette.dart';
import 'package:expense_tracker/presentation/widgets/add_new_expense_dialog.dart';
import 'package:expense_tracker/presentation/widgets/bar_chart_widget.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Consumer<ExpenseProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Expanse Tracker'),
            titleTextStyle: textTheme.headlineSmall!.copyWith(
              color: Palette.textDark,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Palette.pinkMocha,
            onPressed: () {
              addNewExpenseDialog(context);
            },
            child: const Icon(Icons.add),
          ),
          body: provider.expenses.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'No Expanse This Week',
                        style: textTheme.titleLarge,
                      ),
                      Text(
                        'Add some expanse click + button below',
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              : ListView(
                  children: [
                    BarChartWidget(
                      expense: provider.getAllExpenseOnThisWeek(),
                    ),
                    ...provider.expenses.map(
                      (expense) => Slidable(
                        key: ValueKey(expense.name + expense.date.toString()),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {},
                              backgroundColor: Palette.blueMocha,
                              foregroundColor: Colors.white,
                              icon: Icons.edit,
                              label: 'Edit',
                            ),
                            SlidableAction(
                              onPressed: (context) {
                                provider.deleteExpense(expense);
                              },
                              backgroundColor: Palette.redMocha,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(expense.name),
                          subtitle: Text(
                            Utils.convertedDateTimeToString(expense.date),
                          ),
                          trailing: Text(
                            Utils.idCurrencyFormatter(expense.amount),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
