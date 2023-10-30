import 'package:drivesafe/screens/trip_details_map/maps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class FurtherTripDetailsView extends StatefulWidget {
  const FurtherTripDetailsView({Key? key}) : super(key: key);

  @override
  State<FurtherTripDetailsView> createState() => _FurtherTripDetailsViewState();
}

class _FurtherTripDetailsViewState extends State<FurtherTripDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff121212),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 20, start: 20, end: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "17 June 2021, 05:40 pm",
              style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4B4B4B)),
            ),
            SizedBox(height: 23.h),
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
                          "Home",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff121212),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Text(
                          "Vadodara",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xff121212),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    CircularPercentIndicator(
                      radius: 20.r,
                      percent: 0.7,
                      progressColor: const Color(0xffEFA83E),
                      backgroundColor: Colors.transparent,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "74%",
                        style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w800,
                            color: const Color(0xff848484)),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "AVERAGE",
                      style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 26.h),
            Container(
              height: 500.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: const Color(0xff000000),
                ),
              ),
              child: const TripDetailsMapView(),
            ),
            // SizedBox(
            //   height: 70.h,
            //   child: const TripDiagnoseView(
            //     totalDeist: "110 Km",
            //     totalTime: "1 h 32 m",
            //     highSpeed: "140 km/h",
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
