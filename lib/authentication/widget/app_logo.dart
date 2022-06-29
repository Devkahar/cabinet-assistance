import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  final bool welcomeTextRequired;
  const AppLogo({Key? key, this.welcomeTextRequired = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 195.w,
        child: Column(
          children: [
            if(welcomeTextRequired)
              Text(
                'Welcome To',
                style: Theme.of(context).textTheme.subtitle2,
              ),
            SvgPicture.asset(
              'assets/images/logo.svg',
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
