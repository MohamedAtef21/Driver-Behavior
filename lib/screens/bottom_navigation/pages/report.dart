import 'package:drivesafe/screens/bar_graph/bar_graph.dart';
import 'package:drivesafe/screens/core/design/alerts_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/logic/helper_method.dart';
import '../../menu/view.dart';

class ReportView extends StatefulWidget {
  const ReportView({Key? key}) : super(key: key);

  @override
  State<ReportView> createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  //list of daily alerts
  List<double> dailyReport = [
    4.40,
    2.50,
    4.2,
    10.50,
    9.20,
    11.99,
    5.10,
  ];

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
            onPressed: () {
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
      body: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20, top: 20, end: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset("assets/icons/daily_report.svg"),
                SizedBox(width: 10.w),
                Text(
                  "Daily Report",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Material(
              elevation: 5,
              shadowColor: const Color(0xff5A6CEA).withOpacity(.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                height: 40.h,
                width: 374.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: const Color(0xffDDDDDD),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.only(start: 10, end: 10),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/icons/arrow_left2.svg"),
                        Text(
                          "17 June 2021",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff4B4B4B),
                          ),
                        ),
                        SvgPicture.asset("assets/icons/arrow_right2.svg"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 36.h),
            Row(
              children: [
                Text(
                  "12 ",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xffF66262),
                  ),
                ),
                Text(
                  "Alerts",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff121212),
                  ),
                ),
              ],
            ),
            SizedBox(height: 45.h),
            SizedBox(
              height: 255.h,
              width: double.infinity,
              child: BarGraphView(
                dailyReport: dailyReport,
              ),
            ),
            SizedBox(height: 45.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AlertsColorView(
                          alertColor: Color(0xff67D9C0),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Seat Belt Alerts - 1",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff848484),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        const AlertsColorView(
                          alertColor: Color(0xff435B99),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Over Speed Alerts - 5",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff848484),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const AlertsColorView(
                          alertColor: Color(0xffCB82FF),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Harsh brake Alerts - 3",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff848484),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        const AlertsColorView(
                          alertColor: Color(0xffD2D2D2),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          "Car-Idling Alerts - 3",
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xff848484),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 52.h),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Trips",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "Total Distance Driven ",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      "Highest Speed of all day ",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                  ],
                ),
                SizedBox(width: 43.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      ""
                          ": 110 km",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff4B4B4B)),
                    ),
                    SizedBox(height: 3.h),
                    Text(
                      ": 140 km/h",
                      style: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xffF66262)),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
