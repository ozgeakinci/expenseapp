import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category { food, education, travel, work }

const categoryIcons = {
  Category.food: Icons.food_bank,
  Category.education: Icons.cast_for_education,
  Category.travel: Icons.travel_explore,
};

class Expense {
  Expense(
      {required this.name,
      required this.price,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String name;
  final double price;
  final DateTime date;
  final Category category;

  //getter method bir değişken gibi davranan method
  //setter metod bir değişken gibi davranan method

  String get formattedDate {
    var formatter = DateFormat.yMd();
    return formatter.format(date);
  }
}
