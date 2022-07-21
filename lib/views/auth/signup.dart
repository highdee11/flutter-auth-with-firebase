import 'package:flutter/material.dart';
import 'package:ourpass_auth/core/providers/user-provider.dart';
import 'package:ourpass_auth/utils/services/ui-service.dart';
import 'package:ourpass_auth/utils/services/validation-service.dart';
import 'package:ourpass_auth/views/auth/login.dart';
import 'package:ourpass_auth/widgets/auth/input_box.dart';
import 'package:ourpass_auth/widgets/forms/block_button.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {

  final TextEditingController _nameController = TextEditingController(text: "Aladesiun Idowu");
  final TextEditingController _emailController = TextEditingController(text: "highdee.ai@gmail.com");
  final TextEditingController _passwordController = TextEditingController(text: "Aladesiun11.");

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  UserProvider? _userProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _userProvider = Provider.of<UserProvider>(context, listen: false);

  }

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
                    const Text(
                        'Create Account',
                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                        label: 'Full-name',
                        hintText: 'Full-name',
                        autoFocus: true,
                        validator: ValidationService.isValidInput,
                        controller: _nameController,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                        label: 'Email',
                        hintText: 'Email',
                        autoFocus: true,
                        validator: ValidationService.isValidEmail,
                        controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    CustomInputField(
                        label: 'Password',
                        hintText: 'Password',
                        isPassword: true,
                        validator: ValidationService.isValidPassword,
                        controller: _passwordController,
                    ),
                    const SizedBox(height: 40),
                    BlockButton(
                      label: 'Sign Up',
                      onTap: _proceed,
                      isLoading: isLoading,
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("Already have an account?", style: TextStyle(color: Color(0xff76777D), fontSize: 15)),
                          InkWell(
                            child:Text(' Sign in', style: TextStyle(color: Color(0xff1e329d), fontSize: 16 )),
                          ),
                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
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
    if(!_formKey.currentState!.validate()) return;

    Map payload = {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text
    };

    _userProvider?.createAccount(payload);
  }
}




