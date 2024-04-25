import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:derma/DetailsDoctor.dart';
import 'package:derma/responsive_layout.dart';
import '../Both/ScanPage.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeDoctor(),
  ),
);

class HomeDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      builder: (BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/doct.png'),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 300,
                    color: Colors.grey[300],
                  ),
                ),
              ),
              Positioned(
                top: 180,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 350,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(27),
                      border: Border.all(
                        color: Color.fromRGBO(69, 69, 113, 1),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Search for a doctor',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(69, 69, 113, 1),
                                      borderRadius: BorderRadius.circular(27),
                                      border: Border.all(
                                        color: Color.fromRGBO(69, 69, 113, 1),
                                        width: 1,
                                      ),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 85,
                left: 35,
                child: Text(
                  'Welcome, Nadia',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 69, 113, 1),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 125,
                left: 35,
                child: Text(
                  'Premium Solutions Awaiting\n Your Selection',
                  style: TextStyle(
                    color: Color.fromRGBO(159, 115, 171, 1),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                top: 235,
                left: 0,
                right: 220,
                child: Center(
                  child: Text(
                    'Top Doctors',
                    style: TextStyle(
                      color: Color.fromRGBO(69, 69, 113, 1),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              _buildTopDoctors(context),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTopDoctors(BuildContext context) {
    return Positioned(
      top: 260,
      left: 20,
      right: 0,
      child: Column(
        children: [
          Container(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CircleImageCard(
                  imagePath: 'assets/images/doctor.png',
                  doctorName: 'Dr.Steller Kane',
                  rating: 4.5,
                  onPressed: () {
                    // Add your functionality here
                  },
                ),
                SizedBox(width: 10),
                CircleImageCard(
                  imagePath: 'assets/images/doctor.png',
                  doctorName: 'Dr.Steller Kane',
                  rating: 3.8,
                  onPressed: () {
                    // Add your functionality here
                  },
                ),
                SizedBox(width: 10),
                CircleImageCard(
                  imagePath: 'assets/images/doctor.png',
                  doctorName: 'Dr.Steller Kane',
                  rating: 5.0,
                  onPressed: () {
                    // Add your functionality here
                  },
                ),
                SizedBox(width: 10),
                CircleImageCard(
                  imagePath: 'assets/images/doctor.png',
                  doctorName: 'Dr.Steller Kane',
                  rating: 4.2,
                  onPressed: () {
                    // Add your functionality here
                  },
                ),
                SizedBox(width: 10),
                CircleImageCard(
                  imagePath: 'assets/images/doctor.png',
                  doctorName: 'Dr.Steller Kane',
                  rating: 4.7,
                  onPressed: () {
                    // Add your functionality here
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Center(
            child: Container(
              height: 150,
              width: 350,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFF454571),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('assets/images/face.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: 90,
                    child: Text(
                      'Empower your skin health with AI\n'
                          'diagnosis. Try it today' 'for precise\n'
                          'results personalized to you.',
                      style: TextStyle(
                        color: Color.fromRGBO(69, 69, 113, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 105,
                    right: 35,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ScanPage()),);
                      },
                      child: Container(
                        width: 192,
                        height: 43,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 195,
                                height: 43,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFEAEAEA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 176.64,
                                height: 40,
                                decoration: ShapeDecoration(
                                  color: Color(0xFF454571),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.50),
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Start',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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

class CircleImageCard extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final double rating;
  final VoidCallback onPressed;

  CircleImageCard({
    required this.imagePath,
    required this.doctorName,
    required this.rating,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 100,
      height: 180,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            doctorName,
            style: TextStyle(
              color: Color.fromRGBO(69, 69, 113, 1),
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingBar.builder(
                initialRating: rating,
                minRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 12,
                itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(width: 5),
              SizedBox(
                width: 8,
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 12,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsDoctor()),
              );
            },
            child: Container(
              width: 70,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(159, 115, 171, 1),
                    Color.fromRGBO(159, 115, 171, 1),
                  ],
                ),
              ),
              child: Text(
                'Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
