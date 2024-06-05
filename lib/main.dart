import 'dart:math';
import 'package:flutter/material.dart';
import 'package:proje1/lib/user_list.dart';
import 'package:proje1/lib/user_model.dart';
import 'package:proje1/log_in.dart';
import 'package:proje1/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GirisEkrani(),
    );
  }
}


