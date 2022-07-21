import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/ui-service.dart';
import 'package:ourpass_auth/utils/services/validation-service.dart';
import 'package:ourpass_auth/widgets/auth/input_box.dart';
import 'package:ourpass_auth/widgets/forms/block_button.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class AuthTokenScreen extends StatefulWidget {
  const AuthTokenScreen({Key? key}) : super(key: key);

  @override
  State<AuthTokenScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthTokenScreen> {

  TextEditingController _pinController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("VERIFICATION", style: TextStyle(
            color: Colors.black, fontSize: 16
        )),
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black,),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),
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
                  const SizedBox(height: 10),
                  const Text(
                    'Verify your email',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
                  ),
                  const SizedBox(height: 10),
                  Text("Please provide the token sent to your email",
                      style: TextStyle(fontSize: 13)),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    autofocus: true,
                    controller: _pinController,
                    hideCharacter: false,
                    pinBoxBorderWidth: 0,
                    hasTextBorderColor: Colors.transparent,
                    maxLength: 6,
                    pinBoxColor: Colors.grey.withOpacity(0.05),
                    onTextChanged: (text) {
                      setState((){});
                    },
                    onDone: (text) {
                      print("DONE $text");
                      print("DONE CONTROLLER ${_pinController.text}");
                    },
                    pinBoxWidth: constraints.maxWidth * 0.105,
                    pinBoxHeight: constraints.maxWidth * 0.13,
                    wrapAlignment: WrapAlignment.spaceAround,
                    pinTextStyle: TextStyle(fontSize: 22.0),
                    pinTextAnimatedSwitcherTransition:
                    ProvidedPinBoxTextAnimation.scalingTransition,
                    pinTextAnimatedSwitcherDuration:Duration(milliseconds: 300),
                    highlightAnimation: true,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 40),
                  BlockButton(
                    label: 'Sign Up',
                    onTap: (){},
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




