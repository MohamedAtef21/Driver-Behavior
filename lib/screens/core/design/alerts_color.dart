import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertsColorView extends StatelessWidget {
  final Color alertColor;
  const AlertsColorView({Key? key, required this.alertColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: 15.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: alertColor,
      ),
    );
  }
}
