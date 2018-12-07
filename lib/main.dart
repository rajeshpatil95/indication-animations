import 'package:flutter/material.dart';
import 'package:indication_animations/elastic_in_out.dart';
import 'package:indication_animations/blinking.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Scaffold(
        body: Blinking(),
      )
    );
  }
}
