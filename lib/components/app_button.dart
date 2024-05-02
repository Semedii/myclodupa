import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  const AppButton({required this.title,  this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.brown,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
