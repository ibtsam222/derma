import 'package:flutter/material.dart';

class RatedByPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rated By'),
        backgroundColor: Color.fromRGBO(69, 69, 113, 1),
      ),
      body: ListView.builder(
        itemCount: 5, // Replace this with the actual number of users
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Patient ${index + 1}'),
            subtitle: Row(
              children: [
                Text('Rating: '),
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text('${(index + 1) * 0.5}'), // Example rating
              ],
            ),
            onTap: () {
              // Add functionality to navigate to user's profile or details
              // You can use Navigator.push to navigate to a new page
            },
          );
        },
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RatedByPage(),
    ),
  );
}
