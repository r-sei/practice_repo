import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/date_time_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TimeForm extends ConsumerWidget {
  const TimeForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final time = ref.watch(timeProvider);
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
                      initialTime: TimeOfDay.now());
                  // print("finished: $date");
                  if (timeData != null) {
                    if (!context.mounted) {
                      return;
                    }
                    String timeString = timeData.format(context);
                    ref.read(timeProvider.notifier).update((_) => timeString);
                  }
                },
                icon: const Icon(Icons.access_time)),
            Text(time),
          ],
        ),
      ),
    ]);
  }
}
