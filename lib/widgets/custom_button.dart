import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
   CustomElevatedButton({
    required this.text,
    required this.onPressed,
  });
  VoidCallback onPressed;


  final String text;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context)
        .size
        .width; // to get the height and width of the screen
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        minimumSize: Size(width, height * 0.06),
        maximumSize: Size(width, height * 0.06),
      ),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(fontSize: 20)),
    );
  }
}
