import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soowgood/benificiary/screen/beneficiary_main_screen.dart';
import 'package:soowgood/common/local_database/key_constants.dart';
import 'package:soowgood/common/local_database/my_shared_preference.dart';
import 'package:soowgood/common/resources/my_assets.dart';
import 'package:soowgood/common/screen/login_screen.dart';
import 'package:soowgood/provider/screen/provider_dashboard_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    handleSession();
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

  ///*
  ///
  /// check user login or not
  void handleSession() async {
    await MySharedPreference.getInstance();
    Future.delayed(const Duration(milliseconds: 1700), () {
      if (MySharedPreference.getBool(KeyConstants.keyIsLogin) ?? false) {
        if (MySharedPreference.getString(KeyConstants.keyUserRole) ==
            'Provider') {
          Get.offAll(const ProviderDashboardScreen());
        } else {
          Get.offAll(const BeneficiaryMainScreen());
        }
      } else {
        Get.offAll(const LoginScreen());
      }
    });
  }
}
