import 'package:flutter/material.dart';
import 'package:ourpass_auth/utils/services/ui_service.dart';

class BlockButton extends StatelessWidget {
  final String label;
  final Function()? onTap;

  const BlockButton({
    Key? key,
    required this.label,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            primary: UIService.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 20),
            shape:  RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
      ),
    );
  }
}