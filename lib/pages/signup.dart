import 'package:caht_app/const/const.dart';
import 'package:caht_app/helper/show_snackbar.dart';

import 'package:caht_app/widgets/custom_botton.dart';
import 'package:caht_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

// ignore: must_be_immutable
class SignupPage extends StatefulWidget {
  SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String? email;

  String? password;

  bool isloading = false;

  GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/scholar.png"),
                    Text(
                      "Scholar Chat",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico',
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        textAlign: TextAlign.start,
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      obscureText: false,
                      hint: "Email",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      obscureText: true,
                      hint: "Password",
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(height: 25.h),
                    CustomBotton(
                      text: "Sign Up",
                      ontap: () async {
                        if (_formKey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await SignUp();
                          Navigator.pop(context);
                        //  Navigator.pushNamed(context, Chatpage.id);
                            
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(
                                context,
                                "The password provided is too weak.",
                              );
                            } else if (e.code == 'email-already-in-use') {
                              showSnackBar(context, "Email already Exists.");
                            }
                          }
                          isloading = false;
                          setState(() {});
                        }
                      },
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'login');
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Future<void> showSnackBar(BuildContext context, String message) async {
  //   await ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  Future<void> SignUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
