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
            decoration: InputDecoration(
                label: Text('Expense Name',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.bold))),
          ),
          TextField(
            controller: _amoutController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text('Amount',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold)),
              prefixText: '₺',
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text('Date',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  Text(DateFormat.yMd().format(date)),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: IconButton(
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: date,
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                  colorScheme: const ColorScheme.light(
                                      onPrimary:
                                          Colors.white, // selected text color
                                      onSurface:
                                          Colors.black, // default text color
                                      primary: Color.fromARGB(
                                          255, 78, 112, 248) // circle color
                                      ),
                                  dialogBackgroundColor: Colors.white,
                                  textButtonTheme: TextButtonThemeData(
                                      style: TextButton.styleFrom(
                                          textStyle: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              fontFamily: 'Quicksand'),
                                          foregroundColor: Colors
                                              .white, // color of button's letters
                                          backgroundColor: const Color.fromARGB(
                                              255,
                                              78,
                                              112,
                                              248), //Background color
                                          shape: RoundedRectangleBorder(
                                              side: const BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                  style: BorderStyle.solid),
                                              borderRadius:
                                                  BorderRadius.circular(30))))),
                              child: child!,
                            );
                          });

                      if (newDate == null) return;
                      setState(() {
                        date = newDate;
                      });
                    },
                    icon: const Icon(Icons.calendar_month)),
              ),
            ],
          ),
          const Divider(
            height: 50,
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 78, 112, 248),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(120, 44)),
              onPressed: () {
                print('Kayıt başarılı :  $_nameController.text');
              },
              child: const Text("Kaydet"))
        ],
      ),
    );
  }
}
