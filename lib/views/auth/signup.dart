import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/ui_service.dart';
import 'package:ourpass_auth/utils/services/validation-service.dart';
import 'package:ourpass_auth/widgets/auth/input_box.dart';
import 'package:ourpass_auth/widgets/forms/block_button.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints){
          return SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: constraints.maxHeight,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: rSpaceMax(constraints.maxHeight * 0.1, 80)),
                  const Text(
                      'Login to your account',
                      style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                      label: '',
                      hintText: 'Email',
                      autoFocus: true,
                      validator: ValidationService.isValidEmail
                  ),
                  const SizedBox(height: 20),
                  CustomInputField(
                      label: '',
                      hintText: 'Password',
                      isPassword: true,
                      validator: ValidationService.isValidPassword
                  ),
                  const SizedBox(height: 40),
                  BlockButton(
                    label: 'Sign Up',
                    onTap: (){},
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Didn’t have an account?', style: TextStyle(color: Color(0xff76777D), fontSize: 15)),
                      InkWell(
                        child:Text(' Sign up', style: TextStyle(color: Color(0xff1e329d), fontSize: 16 )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}




