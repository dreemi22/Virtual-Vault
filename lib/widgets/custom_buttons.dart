import 'package:flutter/material.dart';
import 'package:virtualvault/constants.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function onPress;
  const DefaultButton({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class DefaultButtonblack extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  const DefaultButtonblack({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class OutlinedButtonBlack extends StatelessWidget {
  final String text;
  final Function onPress;
  const OutlinedButtonBlack({
    super.key,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPress();
      },
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(
              color: Colors.black,
            )),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(fontSize: 25, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
