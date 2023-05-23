import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soowgood/common/screen/welcome_screen.dart';
import '../resources/my_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration.zero, () {
      Get.off(const WelcomeScreen());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: welcomeImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 8.0),
                child: Text(
                  'Welcome to',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 34.0,
                      fontFamily: 'poppins_bold'),
                ),
              ),
              Image(
                image: welcomeLogo,
              ),
              const SizedBox(
                height: 100,
              )
            ],
          )
        ],
      ),
    );
  }
}
