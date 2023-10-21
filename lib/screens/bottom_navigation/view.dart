import 'package:drivesafe/screens/bottom_navigation/pages/dashboard.dart';
import 'package:drivesafe/screens/bottom_navigation/pages/profile.dart';
import 'package:drivesafe/screens/bottom_navigation/pages/report.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  List<Widget> pages = [
    const DashBoardView(),
    const ReportView(),
    const ProfileView(),
  ];

  List<String> titles = [
    "Dashboard",
    "Report",
    "Profile",
  ];

  int currenPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currenPage],
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            _ItemBottom(
              title: "Dashboard",
              image: "dashboardC",
              unselectedImage: "dashboard",
              onTap: () {
                currenPage = 0;
                setState(() {});
              },
              isSelected: currenPage == 0,
            ),
            _ItemBottom(
              title: "Report",
              image: "reportC",
              unselectedImage: "report",
              onTap: () {
                currenPage = 1;
                setState(() {});
              },
              isSelected: currenPage == 1,
            ),
            _ItemBottom(
              title: "Profile",
              image: "profileC",
              unselectedImage: "profile",
              onTap: () {
                currenPage = 2;
                setState(() {});
              },
              isSelected: currenPage == 2,
            ),
          ],
        ),
      ),
    );
  }
}

class _ItemBottom extends StatelessWidget {
  final String title, image, unselectedImage;
  final VoidCallback onTap;
  final bool isSelected;

  const _ItemBottom(
      {Key? key,
      required this.title,
      required this.image,
      required this.onTap,
      required this.isSelected,
      required this.unselectedImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 13, bottom: 13),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(
                  isSelected
                      ? "assets/icons/$image.svg"
                      : "assets/icons/$unselectedImage.svg",
                ),
                SizedBox(height: 3.h),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isSelected ? const Color(0xff121212) : const Color(0xff4B4B4B),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
