


import 'package:cabinet_assistant/constants/route_constants.dart';
import 'package:cabinet_assistant/register/phonen_number_screen.dart';
import 'package:flutter/material.dart';

class Routes{
  static Map<String,WidgetBuilder> getRoutes(RouteSettings settings) => {
    RouteList.phoneNumberScreen : (ctx) => const PhoneNumberScreen(),
  };
}