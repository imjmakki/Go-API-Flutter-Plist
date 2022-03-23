import 'package:flutter/material.dart';
import 'productModel.dart';

void main() {
  runApp(AppRun());
}

class AppRun extends StatefulWidget {
  const AppRun({Key? key}) : super(key: key);

  @override
  State<AppRun> createState() => _AppRunState();
}

class _AppRunState extends State<AppRun> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade200,
        body: SizedBox.expand(),
      ),
    );
  }
}
