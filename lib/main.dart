import 'package:expenseapp/pages/expense_list.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('ExpenseApp'),
        backgroundColor: const Color.fromARGB(199, 78, 68, 193),
        centerTitle: true,
        toolbarHeight: 70,
        titleTextStyle:
            const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      body: const ExpenseList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color.fromARGB(197, 74, 225, 145),
        child: const Icon(Icons.add),
      ),
    ),
  ));
}
