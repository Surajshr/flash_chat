import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom(
      {required this.onPress, this.buttonTitle, this.buttonColor});

  final Function()? onPress;
  final String? buttonTitle;
  final Color? buttonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            '$buttonTitle',
            style: const TextStyle(
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}
