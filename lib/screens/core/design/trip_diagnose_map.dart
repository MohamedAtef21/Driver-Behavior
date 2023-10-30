import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDiagnoseMapView extends StatelessWidget {
  final String totalDeist, totalTime, highSpeed,speedLimitCrossings;
  //final int speedLimitCrossings;
  const TripDiagnoseMapView({Key? key, required this.totalDeist, required this.totalTime, required this.highSpeed, required this.speedLimitCrossings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color:  const Color(0xff121212),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 19,top: 10,end: 19,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(totalDeist,style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Total Distance",style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: SvgPicture.asset("assets/icons/line.svg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(totalTime,style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Time",style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: SvgPicture.asset("assets/icons/line.svg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(highSpeed,style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Highest Speed",style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: SvgPicture.asset("assets/icons/line.svg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(speedLimitCrossings,style: GoogleFonts.inter(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Total Alerts",style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
