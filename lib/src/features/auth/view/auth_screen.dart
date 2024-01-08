import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traffic_safety/src/app/router/router.gr.dart';
import 'package:traffic_safety/src/constants/colors.dart';
import 'package:traffic_safety/src/features/auth/repo/auth_repo.dart';
import 'package:traffic_safety/src/utils/dialogs/error_dialog.dart';
import 'package:traffic_safety/src/utils/shared_preferences/shared_preferences.dart';
import 'package:traffic_safety/src/utils/text_validation/text_validation.dart';

import '../../../constants/buttons/app_button.dart';
import '../../../constants/textfield/app_text_field.dart';

@RoutePage()
class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool isSignIn = true;
  bool showPass = true;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                30.verticalSpace,
                Text(
                  'RoadSync',
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600),
                ),
                50.verticalSpace,
                Text(
                  isSignIn ? 'SIGN IN' : "SIGN UP",
                  style: TextStyle(
                      color: blueColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                10.verticalSpace,
                AppTextField(
                  hintText: "Email",
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => Validate.email(value!),
                ),
                20.verticalSpace,
                AppTextField(
                  hintText: "Password",
                  controller: _passController,
                  obsecure: showPass,
                  maxlines: 1,
                  keyboardType: TextInputType.streetAddress,
                  suffixIcon: IconButton(
                    icon: showPass
                        ? Icon(
                            Icons.remove_red_eye,
                            color: blueColor,
                          )
                        : Icon(
                      Icons.remove_red_eye_outlined,
                            color: blueColor,
                          ),
                    onPressed: () => setState(() => showPass = !showPass),
                  ),
                ),
                40.verticalSpace,
                AppButton(
                  text: isSignIn ? 'Sign In' : "Sign Up",
                  onTap: () async {
                   if(formKey.currentState!.validate()){
                     UserCredential? res;
                     if (isSignIn) {
                       res = await AuthRepo().login(_emailController.text.trim(),
                           _passController.text.trim(), context);
                     } else {
                       res = await AuthRepo().signUp(_emailController.text.trim(),
                           _passController.text.trim(), context);
                     }

                     if (res != null) {
                       if (context.mounted) {
                         UserPreferences.setUser(userId: res.user!.uid);
                         context.router.replaceAll([const HomeRoute()]);
                       }
                     }
                   }
                  },
                ),
                10.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isSignIn
                          ? 'Don\'t have an account ?'
                          : "Already have an account ?",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() => isSignIn = !isSignIn);
                      },
                      child: Text(
                        isSignIn ? 'Create Account' : "Sign In",
                        style: TextStyle(
                            fontSize: 14.sp, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
