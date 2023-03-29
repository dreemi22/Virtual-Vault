import 'package:flutter/material.dart';

class PrivateKeyField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const PrivateKeyField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        hintText: hintText,
        prefixIcon: Icon(
          Icons.wallet,
          color: Colors.black.withOpacity(.5),
        ),
        hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class WalletPinTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const WalletPinTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        hintText: hintText,
        prefixIcon: Icon(
          Icons.password_outlined,
          color: Colors.black.withOpacity(.5),
        ),
        hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}

class PhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  const PhoneField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        hintText: hintText,
        prefixIcon: Icon(
          Icons.phone,
          color: Colors.black.withOpacity(.5),
        ),
        hintStyle: TextStyle(color: Colors.black.withOpacity(.5)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black, width: 1.0),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
