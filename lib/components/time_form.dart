import 'package:flutter/material.dart';

class TimeForm extends StatefulWidget {
  const TimeForm({super.key});

  @override
  State<TimeForm> createState() => _TimeFormState();
}

class _TimeFormState extends State<TimeForm> {
  TimeOfDay? selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SizedBox(
        child: Text(
          'Time',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
      Container(
        color: const Color.fromARGB(100, 190, 190, 190),
        child: Row(
          children: [
            IconButton(
                onPressed: () async {
                  // print("start");
                  final timeData = await showTimePicker(
                      initialEntryMode: TimePickerEntryMode.dial,
                      context: context,
                      initialTime: selectedTime != null
                          ? selectedTime!
                          : TimeOfDay.now());
                  // print("finished: $date");
                  if (timeData != null) {
                    setState(() {
                      selectedTime = timeData;
                    });
                  }
                },
                icon: const Icon(Icons.access_time)),
            Text(selectedTime != null
                ? "${selectedTime?.hour}:${selectedTime?.minute}"
                : "hh:mm"),
          ],
        ),
      ),
    ]);
  }
}
