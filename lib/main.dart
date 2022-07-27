import 'package:flutter/material.dart';
import 'pages/choose_location.dart';
import 'pages/home.dart';

import 'pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
routes: {
    '/' : (context) => Loading(),
  '/location': (context) => ChooseLocation(),
  '/home':(context) => home(),
  '/loading':(context) => Loading(),
}
));
