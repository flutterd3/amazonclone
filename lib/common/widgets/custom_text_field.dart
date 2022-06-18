import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //* TextFormField is used because it have validator which helps in showing error to the users....
    return TextFormField(

      // !What are controllers and how do they work?

// I like to think of Controllers as a way to programmatically apply changes in your app that would normally come from user interactions. Controllers are objects you can attach to certain Widgets, and then use those objects to control the behaviour of that Widget. Let's look at some examples:
    
  controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          )),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.black38,
          ))),

      // !This is used when we have sign in and signup in our form fornow just dont think about this
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
