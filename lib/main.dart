import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
import 'package:phone_bookr/services/handle_permission.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HandlePermission(),
    );
  }
}
