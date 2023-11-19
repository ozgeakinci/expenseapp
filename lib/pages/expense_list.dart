import 'package:expenseapp/models/expense.dart';
import 'package:expenseapp/widgets/expense_item.dart';
import 'package:expenseapp/widgets/new_expense.dart';
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
        name: "Grocery Spending",
        price: 400,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: 'Flutter Udemy Course',
        price: 200,
        date: DateTime.now(),
        category: Category.education),
    Expense(
        name: 'Spain Tour',
        price: 25000,
        date: DateTime.now(),
        category: Category.travel),
    Expense(
        name: 'Business lunch',
        price: 1500,
        date: DateTime.now(),
        category: Category.work)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 150, child: Text('Grafik ')),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text('Recent Expenses',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  )),
            ),
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: expenses.length,
            itemBuilder: (context, index) {
              return ExpenseItem(expenses[index]);
            },
          ),
        )
      ],
    );
  }
}
