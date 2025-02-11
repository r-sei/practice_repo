import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class GetWeekday extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('en_US');
    DateTime now = DateTime.now();
    String week = DateFormat('EEEE', 'en_US').format(now);
    String month = DateFormat('MMMM', 'en_US').format(now);

    return Text(
      '$week, ${now.day} $month,',
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}