import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EditProfilePatient(),
  ),
);

class EditProfilePatient extends StatefulWidget {
  @override
  _EditProfilePatientState createState() => _EditProfilePatientState();
}
class _EditProfilePatientState extends State<EditProfilePatient> {
  bool isObscurePassword =true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 69, 113, 1),
        title: Text("Account"),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(
          left: 15,
          top: 20,
          right: 15,
        ),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Color.fromRGBO(69, 69, 113, 1).withOpacity(0.1)
                          )
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image:AssetImage(
                            'assets/images/doctor.png',
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Color.fromRGBO(69, 69, 113, 1),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              buildTextField("Full Name", "Full Name", false),
              buildTextField("Email", "Email@gmail.com", false),
              buildTextField("Password", "Password", true),
              buildTextField("National ID", "National ID", false),
              buildTextField("Phone Number", "Phone Number", false),


              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("CANCEL",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.white,
                        )
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(69, 69, 113, 1),
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("SAVE", style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2,
                      color: Colors.white,
                    )
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(69, 69, 113, 1),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  Widget buildTextField(String LabelText, String placeholder, bool isPasswordTextField)
  {
    return Padding(
      padding:EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: isPasswordTextField ? isObscurePassword: false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              icon: Icon(Icons.remove_red_eye,color: Colors.grey),
              onPressed: () {},
            ):null,
            contentPadding: EdgeInsets.only(bottom: 5),
            //labelText: lableText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            )

        ),
      ),
    );
  }
}
