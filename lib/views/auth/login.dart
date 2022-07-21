import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/ui-service.dart';
import 'package:ourpass_auth/utils/services/validation-service.dart';
import 'package:ourpass_auth/widgets/auth/input_box.dart';
import 'package:ourpass_auth/widgets/forms/block_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();


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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: rSpaceMax(constraints.maxHeight * 0.1, 80)),
                    Text(
                        'Login to your account',
                        style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: '',
                      hintText: 'Email',
                      autoFocus: true,
                      validator: ValidationService.isValidEmail,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                      label: '',
                      hintText: 'Password',
                      isPassword: true,
                      validator: ValidationService.isValidPassword,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 40),
                    BlockButton(
                      label: 'Login',
                      onTap: _proceed,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Don't have an account?", style: TextStyle(color: Color(0xff76777D), fontSize: 15)),
                          InkWell(
                            child:Text(' Sign up', style: TextStyle(color: Color(0xff1e329d), fontSize: 16 )),
                          ),
                        ],
                      ),
                      onTap: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _proceed(){

  }
}




