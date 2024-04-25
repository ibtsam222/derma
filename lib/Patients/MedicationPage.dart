import 'package:flutter/material.dart';

class MedicationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return Scaffold(

      appBar: AppBar(
        title: Text('Scan Page'),
      ),
      body: Center(
        child: Text(
          'med',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
