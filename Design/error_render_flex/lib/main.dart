import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RenderFlex App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RenderFlex App'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.red,
            ),
            Container(
              height: double.infinity,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
