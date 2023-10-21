import 'package:drivesafe/screens/core/logic/helper_method.dart';
import 'package:drivesafe/screens/menu/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../core/design/trip_details.dart';

class DashBoardView extends StatelessWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff121212),
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/menu.svg"),
            onPressed: (){
              navigateTo(context, const MenuView());
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Image.asset(
              "assets/images/profile_image.png",
              height: 50.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 5,
              shadowColor: const Color(0xff5A6CEA).withOpacity(.4),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: Container(
                height: 90.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xff121212),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 22, top: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome, Mohamed ",
                            style: GoogleFonts.inter(
                                fontSize: 21, color: const Color(0xffDDDDDD)),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                "Check your Overall Trip Performance ",
                                style: GoogleFonts.inter(
                                    fontSize: 12,
                                    color: const Color(0xffDDDDDD)),
                              ),
                              SvgPicture.asset("assets/icons/arrow_right.svg"),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 93.w),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 29),
                        child: CircularPercentIndicator(
                          radius: 20.r,
                          percent: 0.8,
                          progressColor: const Color(0xff3EEF85),
                          backgroundColor: Colors.transparent,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            "84%",
                            style: GoogleFonts.inter(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xffDDDDDD)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 20, end: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "DASHBOARD",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xff4B4B4B),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  const TripDetailsView(
                      goingFrom: "Home",
                      goingTo: "Vadodara",
                      totalDist: "110 Km",
                      totalTime: "1 h 32 m",
                      highSpeed: "140 km/h",
                      percent: "74",
                      totalAlerts: "12",
                      perf: "7.5% poor performance than last trip",
                    percentColor: Color(0xffEFA83E),
                    percentAVG: 0.7,
                  ),
                  SizedBox(height: 20.h),
                  const TripDetailsView(
                    goingFrom: "Vadodara",
                    goingTo: "Home",
                    totalDist: "110 Km",
                    totalTime: "1 h 46 m",
                    highSpeed: "120 km/h",
                    percent: "80",
                    totalAlerts: "6",
                    perf: "Same performance as last trip",
                    percentColor: Color(0xff3EEF85),
                    percentAVG: 0.8,
                  ),
                  SizedBox(height: 20.h),
                  const TripDetailsView(
                    goingFrom: "Rajkot",
                    goingTo: "Vadodara",
                    totalDist: "200 Km",
                    totalTime: "2 h 15 m",
                    highSpeed: "140 km/h",
                    percent: "30",
                    totalAlerts: "20",
                    perf: "7.5% poor performance than last trip",
                    percentColor: Color(0xffF66262),
                    percentAVG: 0.3,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
