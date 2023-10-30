import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapSpeedView extends StatelessWidget {
  const MapSpeedView({Key? key}) : super(key: key);

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
          children: [
            Container(
              height: 600.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: const Color(0xff000000),
                ),
              ),
             // child: const TripDetailsMapView(),
            ),
          ],
        ),
      ),
    );
  }
}
