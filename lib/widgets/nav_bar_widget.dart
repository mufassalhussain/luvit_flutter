import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luvit/constnts/assets_path.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      backgroundColor: Colors.black,
      shadowColor: Colors.grey,
      style: TabStyle.fixedCircle,
      items: [
        TabItem(icon: SvgPicture.asset(AssetPath.homeIcon), title: '홈'),
        TabItem(icon: SvgPicture.asset(AssetPath.locationBottom), title: '스팟'),
        TabItem(
          icon: Image.asset(AssetPath.centerBottomNavIco, fit: BoxFit.cover),
        ),
        TabItem(icon: SvgPicture.asset(AssetPath.bottomChatIcon), title: '채팅'),
        TabItem(
            icon: SvgPicture.asset(AssetPath.bottomPersonIcon),
            title: 'Profile'),
      ],
      onTap: (int i) => print('click index=$i'),
    );
  }
}
