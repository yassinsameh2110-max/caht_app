import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({this.hint ,this.onChanged , required this.obscureText, });
  String? hint;
  Function(String)? onChanged;
   bool obscureText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (value) {
        if(value==null || value.isEmpty){
          return "Field is required";
        }
        return null;
      },
      onChanged: onChanged,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      style: TextStyle(color: Colors.white),
    );
  }
}
