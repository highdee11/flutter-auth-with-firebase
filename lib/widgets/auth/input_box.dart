import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/ui-service.dart';

class CustomInputField extends StatefulWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final bool autoFocus;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  CustomInputField({Key? key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    this.autoFocus = false,
    this.validator,
    this.controller,
  }) : super(key: key);

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool _obscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isPassword) _obscureText = true;
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: UIService.boxDecor,
          child: TextFormField(
            decoration: InputDecoration(
                border:   const OutlineInputBorder(),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff414141),
                ),
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                  borderSide: const BorderSide(
                      color: Colors.transparent,
                      width: 1.0
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.0
                  ),
                ),
                suffixIcon: !widget.isPassword ? null :  IconButton(
                  icon: Icon(
                    _obscureText? Icons.visibility : Icons.visibility_off,
                    color: !_obscureText ? UIService.primaryColor : const Color(0xffB8BCC6),
                  ),
                  onPressed: _toggle,
                )
            ),
            validator: widget.validator,
            obscureText: _obscureText,
            autofocus: widget.autoFocus,
            controller: widget.controller,
          ),
        ),
      ],
    );
  }


  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
