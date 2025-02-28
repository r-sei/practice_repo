import 'package:flutter/material.dart';
import 'package:flutter_practice/components/get_weekday.dart';
import 'package:flutter_practice/components/profile_icon.dart';
import 'package:flutter_practice/components/sort_button.dart';
import 'package:flutter_practice/components/todo_modal.dart';
import 'package:flutter_practice/components/todo_tile.dart';
import 'package:flutter_practice/provider/service_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoData = ref.watch(fetchStreamProvider);
    return todoData.when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: Colors.white,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Hello I'm",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.0,
                  )),
              Text("Sei Ryo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  )),
            ],
          ),
          leading: const ProfileIcon(),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.calendar_month)),
            IconButton(onPressed: null, icon: Icon(Icons.notifications_none))
          ],
        ),
        body: ListView(padding: const EdgeInsets.all(20.0), children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Today's Task",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  GetWeekday(),
                ],
              ),
              Expanded(
                child: Container(),
              ),
              ElevatedButton(
                  onPressed: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (BuildContext context) {
                        return TodoModal();
                      }),
                  child: const Text('+ New Task')),
            ],
          ),
          const Gap(24),
          //=========ここにソートボタン===============
          const SortButton(),

          for (final todo in data) ...{
            TodoTile(
              todo: todo,
            ),
            const Gap(24),
          }
        ]),
      );
    }, error: (error, _) {
      return Center(
        child: Text(error.toString()),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
