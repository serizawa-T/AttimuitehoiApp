import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  int result;
  ResultDisplay(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '避けれた回数',
              style: TextStyle(fontSize: 56),
            ),
            Text(
              '$result回',
              style: TextStyle(fontSize: 68, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
