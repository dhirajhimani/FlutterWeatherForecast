import 'package:flutter/material.dart';

class DebugScreen extends StatelessWidget {
  const DebugScreen();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DebugPage(title: 'Simple Debug Screen'),
    );
  }
}

class DebugPage extends StatelessWidget {
  const DebugPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}
