import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlockInputBox extends StatelessWidget {
  final String label;
  final String hintText;
  const BlockInputBox({Key? key,
    required this.label,
    required this.hintText
  }) : super(key: key);

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

            decoration:  InputDecoration(

                border:   OutlineInputBorder(),
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontSize: 17,
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
                )
            ),
          ),
        ),
      ],
    );
  }
}
