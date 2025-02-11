import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
    required this.hintText,
    required this.maxLine,
    required this.txtController,
  });

  final String hintText;
  final int maxLine;
  final TextEditingController txtController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // controller: txtController,
      keyboardType: TextInputType.multiline,
      maxLines: maxLine,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        fillColor: const Color.fromARGB(100, 190, 190, 190),
        filled: true,
        border: InputBorder.none,
      ),
    );
  }
}
