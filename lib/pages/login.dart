import 'package:caht_app/const/const.dart';
import 'package:caht_app/helper/show_snackbar.dart';
import 'package:caht_app/pages/chatPage.dart';
import 'package:caht_app/widgets/custom_botton.dart';
import 'package:caht_app/widgets/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontFamily: 'Pacifico',
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    CustomTextFormField(
                      hint: "Email",
                      onChanged: (data) {
                        email = data;
                      },
                    ),
                    SizedBox(height: 10.h),
                    CustomTextFormField(
                      hint: "Password",
                      onChanged: (data) {
                        password = data;
                      },
                    ),
                    SizedBox(height: 25.h),
                    CustomBotton(
                      text: "Login",
                      ontap: () async {
                        if (_formKey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await LoginUser();

                            Navigator.pushNamed(context, Chatpage.id);
                            // Navigator.pop(context);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              showSnackBar(
                                context,
                                "No user found for that email.",
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
                          "Don't have an account?",
                          style: TextStyle(color: Colors.white),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'signup');
                          },
                          child: Text(
                            "Sign up",
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



  Future<void> LoginUser() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }
}
