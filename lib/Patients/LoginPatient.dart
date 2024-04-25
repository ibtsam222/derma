import 'package:flutter/material.dart';
import 'package:derma/Patients/SignupPatient.dart';



import 'package:derma/Doctors/HomeDoctor.dart';
import 'package:derma/Doctors/root_page.dart';





void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPatient(),
  ),
);

class LoginPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/BackGround .png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 20,

              // duration: Duration(seconds: 1),
              child: Text(
                "DermDiag",
                style: TextStyle(
                  color: Color.fromRGBO(69, 69, 113, 1),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,

                ),
              ),

          ),
          Positioned(
            left: 30,
            top: 20,

              // duration: Duration(seconds: 1),
              child: Container(
                width: 60,
                height: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/LOGO.png'),
                  ),
                ),
              ),

          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 150),

                    Container(
                      margin: EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: Text(
                          "Welcome back!",
                          style: TextStyle(
                            color: Color(0xFF9F73AB),
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[

                           Form(
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Color(0xFF9F73AB)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email, color: Color.fromRGBO(98, 79, 130, 1)),
                                      hintText: "Email",
                                      hintStyle: TextStyle(color: Color.fromRGBO(98, 79, 130, 1)),
                                      border: InputBorder.none,
                                    ),
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter an email';
                                      } else if (!value.contains('@gmail.com')) {
                                        return 'Please enter a valid Gmail address';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 20),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Color(0xFF9F73AB)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10),
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(98, 79, 130, 1)),
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Color.fromRGBO(98, 79, 130, 1)),
                                      border: InputBorder.none,
                                      suffixIcon: Icon(Icons.visibility, color: Color.fromRGBO(98, 79, 130, 1)),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter a password';
                                      } else if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                                        return 'Password must contain at least 1 letter and 1 number';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),


                        SizedBox(height: 30),

                          Container(
                            height: 50,
                            width: 350,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                                    MaterialPageRoute(builder: (context) =>RootPage()),
                                );
                              },
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                                  SizedBox(height: 70),

                           Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(color: Color.fromRGBO(63, 59, 108, 1),fontWeight: FontWeight.bold),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SignupPatient()),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(color: Color(0xFF9F73AB),fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
