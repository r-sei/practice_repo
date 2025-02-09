import 'package:flutter/material.dart';

class DateForm extends StatefulWidget {
  const DateForm({super.key});

  @override
  State<DateForm> createState() => _DateFormState();
}

class _DateFormState extends State<DateForm> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        child: Text(
          'Date',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      //ここからdate入力フォーム
      Container(
        color: const Color.fromARGB(100, 190, 190, 190),
        child: Row(
          children: [
            IconButton(
                onPressed: () async {
                  // print("start");
                  final date = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030));
                  // print("finished: $date");
                  if (date != null) {
                    setState(() {
                      selectedDate = date;
                    });
                  }
                },
                icon: const Icon(Icons.calendar_month)),
            Text(selectedDate != null
                ? "${selectedDate?.year}/${selectedDate?.month}/${selectedDate?.day}"
                : "yyyy/mm/dd"),
          ],
        ),
      ),
    ]);
  }
}
