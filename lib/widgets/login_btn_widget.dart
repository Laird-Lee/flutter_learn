import 'package:flutter/material.dart';

class LoginBtnWidget extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback? onPressed;

  const LoginBtnWidget(
    this.title, {
    super.key,
    this.enable = true,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: enable ? onPressed : null,
      height: 45,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      disabledColor: Colors.white60,
      color: Colors.deepPurpleAccent,
      child: Text(title, style: TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
