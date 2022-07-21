import 'package:flutter/material.dart';
class FilledPasswordInput extends StatefulWidget {
  final String label;
  final String hintText;
  const FilledPasswordInput({Key? key,
    required this.label,
    required this.hintText
  }) : super(key: key);

  @override
  State<FilledPasswordInput> createState() => _FilledPasswordInputState();
}

class _FilledPasswordInputState extends State<FilledPasswordInput> {
  bool _obscureText = true;


  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              boxShadow:[
                BoxShadow(
                  color: Color(0xffe9e9e9),
                  blurRadius: 25.0, // soften the shadow
                  spreadRadius: 1.0, //extend the shadow
                  offset: Offset(
                    1.0, // Move to right 10  horizontally
                    1.0, // Move to bottom 10 Vertically
                  ),
                )
              ]
          ),
          child: TextFormField(
            obscureText:_obscureText,
            decoration:  InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText? Icons.visibility : Icons.visibility_off,
                    color: Color(0xffB8BCC6),
                  ), onPressed: () {
                  _toggle();
                },
                ),
                filled: true,
                fillColor: Colors.white,
                border:   OutlineInputBorder(),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff414141),

                ),
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
                      color: Color(0xff1e329d),
                      width: 1.0
                  ),
                )
            ),
          ),
        ),
      ],
    );
  }
}