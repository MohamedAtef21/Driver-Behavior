import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class DriverProfileView extends StatelessWidget {
  final String driverName, driverMail,driverPhoto,percent;
  final int totalTrips;
  final Color percentColor;
  const DriverProfileView({Key? key, required this.driverName, required this.driverMail, required this.percent, required this.totalTrips, required this.percentColor, required this.driverPhoto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: const Color(0xff5A6CEA).withOpacity(.4),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r)
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/$driverPhoto.png",
                      height: 75.h,
                      width: 75.w,
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          driverName,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff4B4B4B),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          driverMail,
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff4B4B4B),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CircularPercentIndicator(
                  radius: 20,
                  percent: 0.8,
                  progressColor: percentColor,
                  backgroundColor: Colors.transparent,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    "$percent%",
                    style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xff4B4B4B)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 13.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Trips : $totalTrips",style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff4B4B4B),
                ),),
                Material(
                  elevation: 5,
                  shadowColor: const Color(0xff5A6CEA).withOpacity(.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                  child: Container(
                    height: 31.h,
                    width: 72.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.r),
                      color: const Color(0xff121212),
                    ),
                    child: Center(child: SvgPicture.asset("assets/icons/arrow_right_white.svg",height: 15.h,width: 10.w,),),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
