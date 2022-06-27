import 'package:cabinet_assistant/utils/app_color.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final Function? onPressed;

  const ButtonWidget({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed!();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: onPressed != null
              ? AppColor.blue
              : AppColor.blue.withOpacity(.5),
        ),
        height: 40,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
