import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expenseapp/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    Key? key,
    required this.onAdd,
  }) : super(key: key);

  final void Function(Expense expense) onAdd;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _nameController = TextEditingController();
  final _amoutController = TextEditingController();
  DateTime now = DateTime.now();
  DateTime? _selectedDate;
  Category selectedCategory = Category.food;

  void _openDatePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate == null ? now : _selectedDate!,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.light(
              onPrimary: Colors.white, // selected text color
              onSurface: Colors.black, // default text color
              primary: Color.fromARGB(255, 78, 112, 248), // circle color
            ),
            dialogBackgroundColor: Colors.white,
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  fontFamily: 'Quicksand',
                ),
                foregroundColor: Colors.white, // color of button's letters
                backgroundColor:
                    const Color.fromARGB(255, 78, 112, 248), //Background color
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    setState(() {
      _selectedDate = selectedDate;
    });
  }

  void _addNewExpense() {
    final amount = double.tryParse(_amoutController.text);
    if (amount == null ||
        amount < 0 ||
        _nameController.text.isEmpty ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            title: const Text('Validation Error'),
            content: const Text('Please fill all blank area'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'),
              ),
            ],
          );
        }),
      );
    } else {
      Expense newExpense = Expense(
          name: _nameController.text,
          price: amount,
          date: _selectedDate!,
          category: selectedCategory);

      widget.onAdd(newExpense);

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: InputDecoration(
              labelText: 'Expense Name',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          TextField(
            controller: _amoutController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Amount',
              labelStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
              prefixText: '₺',
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Date',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(_selectedDate == null
                      ? 'Please choose date'
                      : DateFormat.yMd().format(_selectedDate!)),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: IconButton(
                    onPressed: () => _openDatePicker(),
                    icon: const Icon(Icons.calendar_month)),
              ),
            ],
          ),
          const Divider(
            height: 30,
            thickness: 1,
            color: Colors.grey,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const Text('Please choose category'),
                ],
              ),
              const Spacer(),
              DropdownButton(
                value: selectedCategory,
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                      value: category, child: Text(category.name.toString()));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    if (value != null) selectedCategory = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(120, 44),
                  foregroundColor: const Color.fromARGB(255, 78, 112, 248),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Vazgeç'),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 78, 112, 248),
                    foregroundColor: Colors.white,
                    fixedSize: const Size(120, 44)),
                onPressed: () {
                  _addNewExpense();
                },
                child: const Text("Kaydet"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
