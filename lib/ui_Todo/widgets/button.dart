import 'package:flutter/material.dart';
import 'package:derma/ui_Todo/pages/home_page.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTap: onTap,
      child:
      Container(

        height: 38,
        width: 310,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(63, 59, 108, 1),
              Color.fromRGBO(63, 59, 108, 1),
            ],
          ),
        ),
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>HomePage()),
            );
          },
          child: Text(
            "Confirm and Save ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontFamily: 'poe',
              height: 1.0,
            ),
          ),
        ),
      ),
    );
  }
}
