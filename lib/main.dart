import 'package:drivesafe/screens/splach_screen/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainPage());
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          title: "Drive Safe",
          debugShowCheckedModeBanner: false,
          // theme: ThemeData(
          //   textTheme: TextTheme(
          //     bodyText2: GoogleFonts.montserrat(),
          //   ),
          // ),
          home: Scaffold(
            body: PageView(
              children: const [
                SplashScreenView(),
              ],
            ),
          ),
        );
      },
    );
  }
}
