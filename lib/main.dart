import 'package:flutter/material.dart';
import 'package:smartmeter/screens/bottomnavBar.dart';
import 'package:smartmeter/screens/loginScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: 
      LoginScreen()
      //LineChartSample2()
      //MyHomePage()
        //HomeScreen()
        //ProfileThreePage()
        //ViewConsumer(),
        //MyHomePage(),
        //userregstration()
        //Screen1(),
        //ControlDevice()
        );
  }
}
