import 'package:expenseapp/pages/expense_list.dart';
import 'package:expenseapp/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 78, 112, 248),
        title: const Text(
          "Expense App",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Color(0xffffffff)),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context, builder: (ctx) => const NewExpense());
              },
              icon: const Icon(Icons.add),
              iconSize: 30,
              color: Colors.white),
        ],
      ),
      body: const ExpenseList(),
    );
  }
}
