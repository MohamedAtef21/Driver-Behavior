import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class TripDiagnoseView extends StatelessWidget {
  final String totalDeist, totalTime, highSpeed;
  const TripDiagnoseView({Key? key, required this.totalDeist, required this.totalTime, required this.highSpeed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 334.w,
      decoration: BoxDecoration(
          color: const Color(0xff121212),
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 19,top: 16,end: 19),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(totalDeist,style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Total Distance",style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: SvgPicture.asset("assets/icons/line.svg"),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(totalTime,style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Time",style: GoogleFonts.inter(
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                  color: const Color(0xffF1F1F1),
                ),
                ),
              ],
            ),
            SizedBox(width: 20.w),
            Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 10),
              child: SvgPicture.asset("assets/icons/line.svg"),
            ),
            SizedBox(width: 20.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(highSpeed,style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xffF1F1F1),
                ),
                ),
                SizedBox(height: 5.h),
                Text("Highest Speed",style: GoogleFonts.inter(
                  fontSize: 10,
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