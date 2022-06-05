import 'package:apex/constants/color_constants.dart';
import 'package:apex/constants/text_styles.dart';
import 'package:flutter/material.dart';

class ApexTextField extends StatefulWidget {
  final TextEditingController? controller;
  final Function()? onTap;
  final Function(String)? onChanged;
  final TextInputType? keyboard;
  final String? hintText;
  final bool obscureText;
  final bool readOnly;

  const ApexTextField({
    this.controller,
    this.onTap,
    this.keyboard = TextInputType.text,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.readOnly = false,
    Key? key,
  }) : super(key: key);

  @override
  State<ApexTextField> createState() => _ApexTextFieldState();
}

class _ApexTextFieldState extends State<ApexTextField> {
  _ApexTextFieldState();

  bool get hasText => widget.controller?.text == '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        onTap: widget.onTap,
        keyboardType: widget.keyboard,
        controller: widget.controller,
        cursorColor: ApexColors.black,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly,
        style: ApexTextStyles.kBlack16,
        decoration: InputDecoration(
          hintStyle: ApexTextStyles.kAsh16,
          hintText: widget.hintText,
          filled: true,
          fillColor: ApexColors.lightGrey,
          contentPadding: EdgeInsets.all(20.0),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20.0),),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ApexColors.orange, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
        ),
      ),
    );
  }
}
