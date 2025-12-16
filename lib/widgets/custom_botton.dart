import 'package:caht_app/const/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBotton extends StatelessWidget {
   CustomBotton({required this.text, this.ontap});
   VoidCallback? ontap;
    String text ;
  @override
  Widget build(BuildContext context) {
  
    return  GestureDetector(
      onTap:ontap ,
      child: Container(width: double.infinity, height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(
                      color:KPrimaryColor,
                      fontSize: 16.sp,
                     
                      fontFamily: 'Pacifico',
                    ),
                  ),
                ),
              ),
    );
  }
}