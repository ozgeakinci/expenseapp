import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  // var _expenseName = '';

  DateTime date = DateTime.now();

  final _nameController = TextEditingController();
  final _amoutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Expense Name')),
          ),
          TextField(
            controller: _amoutController,
            keyboardType: TextInputType.number,
            decoration:
                const InputDecoration(label: Text('Amount'), prefixText: ''),
          ),

          //date picker aç
          //date Pickerdan gelen değeri Text olarak yazdırmak
          //seçilen tarihi formatlayarak yazdırmak

          IconButton(
              onPressed: () async {
                DateTime? newDate = await showDatePicker(
                  context: context,
                  initialDate: date,
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );

                if (newDate == null) return;
                setState(() {
                  date = newDate;
                });
              },
              icon: const Icon(Icons.calendar_month)),
          Text(DateFormat.yMd().format(date)),
          ElevatedButton(
              onPressed: () {
                print('Kayıt başarılı :  $_nameController.text');
              },
              child: const Text("Kaydet"))
        ],
      ),
    );
  }
}
