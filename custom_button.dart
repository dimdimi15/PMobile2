import 'package:flutter/material.dart';

class customButton extends StatefulWidget {
  final String text;
  customButton({required this.text});

  @override
  State<customButton> createState() => _customButtonState();
}

class _customButtonState extends State<customButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))),
      onPressed: () {},
      child: Text(
        widget.text,
        style: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 17,
        ),
      ),
    );
  }
}
