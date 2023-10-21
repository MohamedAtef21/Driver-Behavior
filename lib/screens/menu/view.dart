import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDDDDD),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: IconButton(
            icon: SvgPicture.asset("assets/icons/exit.svg"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top: 76, start: 50),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/profile_image.png",
                  height: 83.h,
                  width: 83.w,
                ),
                SizedBox(width: 15.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mohamed Atef",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4B4B4B),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "MohamedAtef@gmail.com",
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xff4B4B4B),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 68.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/profile2.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Profile",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/about.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "About",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/notification.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Notifications",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/settings.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Settings",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/help.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Help and Support",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 34.h),
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/logout.svg",
                  height: 24.h,
                  width: 24.w,
                ),
                SizedBox(width: 10.w),
                Text(
                  "Logout",
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: const Color(0xff4B4B4B),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Version : 1.0.0",
                    style:
                        GoogleFonts.inter(fontSize: 10, color: const Color(0xff4B4B4B)),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "Last updated on ",
                    style:
                        GoogleFonts.inter(fontSize: 10, color: const Color(0xff4B4B4B)),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    "17 june 2021 at 11:30 pm",
                    style: GoogleFonts.inter(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff4B4B4B)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
