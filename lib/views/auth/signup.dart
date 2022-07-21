import 'package:flutter/material.dart';
import 'package:ourpass_auth/widgets/auth/input_box.dart';
import 'package:ourpass_auth/widgets/auth/password_box.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: size.height * 1,
          padding: EdgeInsets.symmetric(horizontal: 20),
          constraints: BoxConstraints(
              minHeight:100
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text('Login to your account',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          )),
                      const SizedBox(height: 20),
                      const BlockInputBox(label: '', hintText: 'Email'),
                      const SizedBox(height: 20),
                      const FilledPasswordInput(label: '', hintText: 'Password'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const RideeatBlockButton(label: 'Sign Up'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didn’t have an account?', style: TextStyle(color: Color(0xff76777D), fontSize: 17)),
                        InkWell(
                          child:Text('Sign up', style: TextStyle(color: Color(0xff1e329d), fontSize: 17, )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class RideeatBlockButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool disabled;

  const RideeatBlockButton({
    Key? key,
    required this.label,
    this.onTap,
    this.disabled = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: disabled ? const Color(0xffFFF1E5) : const Color(0xff1e329d),
        borderRadius: BorderRadius.circular(10),
          boxShadow:[
            BoxShadow(
              color:  Color(0xffe9e9e9),
              blurRadius: 25.0, // soften the shadow
              spreadRadius: 1.0, //extend the shadow
              offset: Offset(
                1.0, // Move to right 10  horizontally
                1.0, // Move to bottom 10 Vertically
              ),
            )
          ]
      ),
      child: TextButton(
        onPressed: onTap,
        child: Text( label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }
}

