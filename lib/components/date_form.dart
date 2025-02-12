import 'package:flutter/material.dart';
import 'package:flutter_practice/provider/date_time_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class DateForm extends ConsumerWidget {
  const DateForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);

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
      Container(
        color: const Color.fromARGB(100, 190, 190, 190),
        child: Row(
          children: [
            IconButton(
                onPressed: () async {
                  final newDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030));
                  if (newDate != null) {
                    final dateString = DateFormat('yyyy/MM/dd').format(newDate);
                    ref.read(dateProvider.notifier).update((_) => dateString);
                  }
                },
                icon: const Icon(Icons.calendar_month)),
            Text(date),
          ],
        ),
      ),
    ]);
  }
}
