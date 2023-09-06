import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constnts/assets_path.dart';
import '../constnts/text_constants.dart';

class AppBarWidget {
  static AppBar appBarLuvit() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(AssetPath.locationMark),
              Text(
                TextConst.appBarTitle,
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.withOpacity(0.4)),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  SvgPicture.asset(AssetPath.starTop),
                  Text(
                    TextConst.appBArStarTopText,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          SvgPicture.asset(AssetPath.notificationIconPath)
        ],
      ),
      backgroundColor: Colors.black,
      elevation: 0,
    );
  }
}
