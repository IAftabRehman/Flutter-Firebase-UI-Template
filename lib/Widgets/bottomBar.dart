

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../Screens/dashboard_Screens/comments.dart';
import '../Screens/dashboard_Screens/homeDashboard.dart';
import '../Screens/dashboard_Screens/profile.dart';
import '../Screens/dashboard_Screens/questions.dart';
import '../Screens/dashboard_Screens/video.dart';

class CustomBottomBarWidget extends StatelessWidget {
  const CustomBottomBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeDashboard(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/images/homeIcon.svg',
              width: 30,
              color: Colors.green,
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/images/homeIcon.svg',
              width: 30,
              color: Color(0xffB4B4B4),
            ),
            activeForegroundColor: Colors.green,
          ),
        ),
        PersistentTabConfig(
          screen: const Questions(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/images/question.svg',
              width: 30,
              color: Colors.green,
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/images/question.svg',
              width: 30,
              color: Color(0xffB4B4B4),
            ),
            activeForegroundColor: Colors.green,
          ),
        ),
        PersistentTabConfig(
          screen: const Video(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/images/video.svg',
              width: 30,
              color: Colors.green,
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/images/video.svg',
              width: 30,
              color: Color(0xffB4B4B4),
            ),
            activeForegroundColor: Colors.green,
          ),
        ),
        PersistentTabConfig(
          screen: const Comments(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/images/comment.svg',
              width: 30,
              color: Colors.green,
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/images/comment.svg',
              width: 30,
              color: Color(0xffB4B4B4),
            ),
            activeForegroundColor: Colors.green,
          ),
        ),
        PersistentTabConfig(
          screen: const Profile(),
          item: ItemConfig(
            icon: SvgPicture.asset(
              'assets/images/profile.svg',
              width: 30,
              color: Colors.green,
            ),
            inactiveIcon: SvgPicture.asset(
              'assets/images/profile.svg',
              width: 30,
              color: Color(0xffB4B4B4),
            ),
            activeForegroundColor: Colors.green,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style4BottomNavBar(
        height: 70,
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),
        itemAnimationProperties: const ItemAnimation(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        ),
      ),
    );
  }
}
