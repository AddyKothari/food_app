import 'package:flutter/material.dart';

class Custom_Text_Feild extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
  final String? hintText;
  final bool? isObscured;
  final bool? enable;

  const Custom_Text_Feild({
    Key? key,
    this.controller,
    this.icon,
    this.hintText,
    this.isObscured,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: TextFormField(
        enabled: enable,
        controller: controller,
        obscureText: isObscured!,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            color: Colors.cyan,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
        ),
      ),
    );
  }
}
