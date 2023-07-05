import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 60); // Clipping starts from the bottom
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _IntroScreenState extends State<IntroScreen> {
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          TitleView(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            child: Container(
              width: 300,
              height: 50,
              alignment: Alignment.center,
              child: Text(
                "Create Account",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {
              // Add your button functionality here
              print('Button pressed');
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          Image.asset('assets/images/intro_background_image.png',
              fit: BoxFit.fill),
        ],
      ),
    );
  }
}

class TitleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo_only.png",
              width: 80,
              height: 80,
            ),
            const SizedBox(height: 40),
            const Text(
              "Easy transition to a more sustainable living",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const Text(
              "Tayuyon would like to request for your location so it can point you to the right sustainable places",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ],
        ));
  }
}
