import 'package:flutter/material.dart';
import 'package:flutter_practice/components/todo_modal.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    super.key,
    required this.todoType,
    required this.selectedType,
    required this.onChanged,
  });

  final TodoType todoType;
  final TodoType? selectedType;
  final void Function(TodoType?) onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: todoType,
      groupValue: selectedType,
      onChanged: onChanged,
      fillColor: WidgetStateProperty.all(todoType.color),
      title: Text(todoType.label,
          style: TextStyle(
            color: todoType.color,
            fontSize: 12.0,
          )),
    );
  }
}
