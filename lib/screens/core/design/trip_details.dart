import 'package:drivesafe/screens/core/design/trip_diagnose.dart';
import 'package:drivesafe/screens/core/logic/helper_method.dart';
import 'package:drivesafe/screens/trip_details_map/trip_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TripDetailsView extends StatelessWidget {
  final String goingFrom,
      goingTo,
      totalDist,
      totalTime,
      highSpeed,
      totalAlerts,
      perf,
      percent;
  final Color percentColor;
  final double percentAVG;

  const TripDetailsView(
      {Key? key,
      required this.goingFrom,
      required this.goingTo,
      required this.totalDist,
      required this.totalTime,
      required this.highSpeed,
      required this.totalAlerts,
      required this.perf,
      required this.percent, required this.percentColor, required this.percentAVG})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigateTo(context, const FurtherTripDetailsView());
      },
      child: Card(
        elevation: 5,
        shadowColor: const Color(0xff5A6CEA).withOpacity(.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r)
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 20, top: 23, end: 20,bottom: 9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/from_to.svg"),
                      SizedBox(width: 6.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            goingFrom,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff121212),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            goingTo,
                            style: GoogleFonts.inter(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xff121212),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CircularPercentIndicator(
                    radius: 20.r,
                    percent: percentAVG,
                    progressColor: percentColor,
                    backgroundColor: Colors.transparent,
                    circularStrokeCap: CircularStrokeCap.round,
                    center: Text(
                      "$percent%",
                      style: GoogleFonts.inter(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xff848484)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17.h),
              TripDiagnoseView(
                  totalDeist: totalDist,
                  totalTime: totalTime,
                  highSpeed: highSpeed),
              SizedBox(height: 20.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/red_dot.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    "Total Alerts : $totalAlerts ",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff4B4B4B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/green_dot.svg"),
                  SizedBox(width: 10.w),
                  Text(
                    perf,
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff4B4B4B),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Text(
                "17 June 2021,  05:40 pm",
                style: GoogleFonts.inter(
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff848484),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
