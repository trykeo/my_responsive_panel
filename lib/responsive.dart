// import 'package:flutter/material.dart';

// class Responsive extends StatelessWidget {
//   final Widget mobile;
//   final Widget tablet;
//   final Widget desktop;

//   const Responsive({
//     super.key,
//     required this.mobile,
//     required this.tablet,
//     required this.desktop,
//   });

//   // Screen for Mobile less than 850px
//   static bool isMobile(BuildContext context) =>
//       MediaQuery.of(context).size.width < 850;

//   // Screen for Tablet between (850 px to 1100 px)
//   static bool isTablet(BuildContext context) =>
//       MediaQuery.of(context).size.width < 1100 &&
//       MediaQuery.of(context).size.width >= 850;

//   //Screen for Desktop more than 1100 px
//   static bool isDesktop(BuildContext context) =>
//       MediaQuery.of(context).size.width >= 1100;

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     if (size.width >= 1100) {
//       return desktop;
//     } else if (size.width >= 850) {
//       return tablet;
//     } else {
//       return mobile;
//     }
//   }
// }
import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    required this.desktop,
  });

// This size work fine on my design, maybe you need some customization depends on your design

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 850;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // If our width is more than 1100 then we consider it a desktop
    if (size.width >= 1100) {
      return desktop;
    }
    // If width it less then 1100 and more then 850 we consider it as tablet
    else if (size.width >= 850 && tablet != null) {
      return tablet!;
    }
    // Or less then that we called it mobile
    else {
      return mobile;
    }
  }
}
