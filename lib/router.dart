
import 'package:flutter/material.dart';

import 'Widget/chart.dart';
import 'Widget/login.dart';




final Map<String, WidgetBuilder> routes = {
  '/summary': (BuildContext context) => Summary(),
  '/login': (BuildContext context) => Login(),
};