import 'package:flutter/material.dart';
import 'package:flutter_architecture_template/di/Locator.dart';
import 'package:flutter_architecture_template/view/widget/SplashWidget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDI();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Architecture demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashWidget(),
    );
  }
}
