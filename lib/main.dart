import 'package:cabinet_assistant/login_screen/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Proxima Nova',
        textTheme:  const TextTheme(
          headline5:  TextStyle( fontWeight: FontWeight.w600,fontSize: 18.0),
          headline1:  TextStyle( fontWeight: FontWeight.w600,fontSize: 22.0,color: Color.fromRGBO(38, 42, 47, 1),),
          headline6: TextStyle(fontWeight: FontWeight.w400,fontSize: 16.0,color: Color.fromRGBO(64, 68, 72, 1),),
        ),
      ),
      home: LoginScreen(),
    );
  }
}
