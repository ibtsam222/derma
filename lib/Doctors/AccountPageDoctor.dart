import 'package:flutter/material.dart';
import 'package:derma/Doctors/EditproDoctor.dart';

void main() {
  runApp(AccountPageDoctor());
}

class AccountPageDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Account'),
          backgroundColor: Color.fromRGBO(69, 69, 113, 1),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor:Colors.grey,
                  backgroundImage: AssetImage(
                      'assets/images/doctor.png'),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Nourhan Ebrahim',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(69, 69, 113, 1)
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Center(
              //   child: Text(
              //     'Nourhan Ebrahim@gmail.com',
              //     style: TextStyle(
              //       fontSize: 16,
              //       color: Colors.grey,
              //     ),
              //   ),
              // ),
              SizedBox(height: 5),
             Center(
               child:ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditProfileDoctor()),
                  );
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all( Color.fromRGBO(69, 69, 113, 1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.edit, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Edit Profile', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
             ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                   backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Icon(Icons.contacts, color: Color.fromRGBO(69, 69, 113, 1)),
                    SizedBox(width: 8),
                    Text('E-call contacts', style: TextStyle(color: Color.fromRGBO(69, 69, 113, 1))),
                  ],
                ),
              ),
          SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.delete, color: Color.fromRGBO(69, 69, 113, 1)),
                    SizedBox(width: 8),
                    Text('Delete Account', style: TextStyle(color: Color.fromRGBO(69, 69, 113, 1),),),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),

                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.history,color: Color.fromRGBO(69, 69, 113, 1)),
                    SizedBox(width: 8),
                    Text('Patient History', style: TextStyle(color: Color.fromRGBO(69, 69, 113, 1),),
                    )],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.language, color: Color.fromRGBO(69, 69, 113, 1)),
                    SizedBox(width: 8),
                    Text('Languages', style: TextStyle(color: Color.fromRGBO(69, 69, 113, 1))),
                  ],
                ),
              ),
              SizedBox(height: 45),
              Center(
             child: ElevatedButton(
                onPressed: () {

                },
                style: ButtonStyle(
                  side: MaterialStateProperty.all(BorderSide(color: Color.fromRGBO(69, 69, 113, 1))), // Add red border
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all( Color.fromRGBO(69, 69, 113, 1)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Logout', style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
