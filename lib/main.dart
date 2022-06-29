import 'package:cabinet_assistant/authentication/phone_number_screen.dart';
import 'package:cabinet_assistant/routing/routing.dart';
import 'package:cabinet_assistant/utils/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primaryColor: Colors.black,
              scaffoldBackgroundColor: Colors.white,
              secondaryHeaderColor: Colors.black,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Proxima Nova',
              textTheme: ThemeText.getTextTheme(),

              appBarTheme: const AppBarTheme(elevation: 0),
            ),
            home: const PhoneNumberScreen(),
            onGenerateRoute: Routing.onGenerateRoute,
          );
      },
    );
  }
}
