import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;

  //! VoidCallback is a function which takes no parameters and returns no parameters. In Flutter it is also true. Sometimes we call it simply callback. Just like any other data type in Dart, we can use the Function data type to assign a value to a variable.
  
  final VoidCallback onTap;
  final Color? color;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: color == null ? Colors.white : Colors.black,
        ),
      ),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        primary: color,
      ),
    );
  }
}
