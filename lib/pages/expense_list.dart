import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatefulWidget {
  const ExpenseList({Key? key}) : super(key: key);

  @override
  _ExpenseListState createState() => _ExpenseListState();
}

class _ExpenseListState extends State<ExpenseList> {
  //dummy data

  final List<Expense> expenses = [
    Expense(
        name: "Yiyecek",
        price: 200,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: 'Flutter Udemy Course',
        price: 200,
        date: DateTime.now(),
        category: Category.education)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 300, child: Text('Grafik ')),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return ExpenseItem(expenses[index]);
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(
              color: Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
