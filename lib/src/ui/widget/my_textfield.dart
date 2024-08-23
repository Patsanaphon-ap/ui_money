import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  const MyTextField({super.key, this.hintText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
        labelText: 'Account no. or Mobile no.',
        hintText: hintText ?? '',
      ),
    );
  }
}
