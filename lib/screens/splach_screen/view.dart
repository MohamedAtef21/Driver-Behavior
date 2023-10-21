import 'dart:async';

import 'package:drivesafe/screens/bottom_navigation/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../core/logic/helper_method.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({Key? key}) : super(key: key);

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3),(){navigateTo(context, const BottomNavigationView(),false);});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splach.png",
              height: 125.h,
            ),
            SizedBox(height: 28.h),
            Text(
              "DriveSafe",
              style: GoogleFonts.montserrat(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                color: const Color(0xffDDDDDD),
              )
            ),
            SizedBox(height: 12.h),
            Text(
              "Because, It pays off ",
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: const Color(0xffDDDDDD),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
