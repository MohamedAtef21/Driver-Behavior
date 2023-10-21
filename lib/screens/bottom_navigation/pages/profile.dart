import 'package:drivesafe/screens/core/design/driver_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/logic/helper_method.dart';
import '../../menu/view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

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
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/profile.svg",
                    height: 17.h,
                    width: 17.w,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Driver Profiles",
                    style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff4B4B4B)),
                  ),
                ],
              ),
              SizedBox(height: 27.h),
              const DriverProfileView(
                driverName: "Mohamed Atef",
                driverMail: "MohamedAtef@gmail.com",
                driverPhoto: "profile_image",
                percent: "80",
                totalTrips: 5,
                percentColor: Color(0xff3EEF85),
              ),
              SizedBox(height: 20.h),
              const DriverProfileView(
                driverName: "Ahmed Hawary",
                driverMail: "AhmedHawary@gmail.com",
                driverPhoto: "profile_image2",
                percent: "70",
                totalTrips: 3,
                percentColor: Color(0xffEFA83E),
              ),
              SizedBox(height: 20.h),
              const DriverProfileView(
                driverName: "Ahmed Atef",
                driverMail: "AhmedAtef@gmail.com",
                driverPhoto: "profile_image",
                percent: "30",
                totalTrips: 1,
                percentColor: Color(0xffF66262),
              ),
            ],
          ),
        ));
  }
}
