import 'package:flutter/material.dart';

import 'router.dart';

void main() async{
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute : '/login',
    );
  }
}