import 'package:flutter/material.dart';

class StopwatchButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function()? onClickFunction;

  const StopwatchButton({
    required this.icon,
    required this.text,
    this.onClickFunction,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        textStyle: const TextStyle(
          fontSize: 24,
        ),
      ),
      onPressed: onClickFunction,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            icon,
            size: 36,
          ),
        ),
        Text(text),
      ]),
    );
  }
}
