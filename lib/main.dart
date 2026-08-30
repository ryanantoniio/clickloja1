import 'package:flutter/material.dart';
import 'telas/splash_page.dart';

void main() {
  runApp(const clickloja1());
}

class clickloja1 extends StatelessWidget {
  const clickloja1({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClickLoja',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const SplashPage(),
    );
  }
}
