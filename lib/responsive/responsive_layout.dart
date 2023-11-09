import 'package:flutter/material.dart';
import 'package:bufoninstagram_flutter/utilities/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {

  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const ResponsiveLayout({
    super.key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constaints){
        if(constaints.maxWidth > webScreenSize){
          return webScreenLayout;
        }
        return mobileScreenLayout;
      }
    );
  }
}