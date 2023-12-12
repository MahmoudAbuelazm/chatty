import 'package:flutter/material.dart';

class CustomFormTextField  extends StatelessWidget {
  CustomFormTextField({Key? key, required this.hint, this.onChanged,this.isPassword=false})
      : super(key: key);
  final String hint;
  Function(String)? onChanged;
  bool? isPassword ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword! ,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your $hint';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
