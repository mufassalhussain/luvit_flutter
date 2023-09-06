import 'package:luvit/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.profile}) : super(key: key);
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 550,
      width: 340,
      padding: const EdgeInsets.symmetric(vertical: 0),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                profile.imageAsset,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: 170,
              width: 340,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3), // Shadow color
                    spreadRadius: 1,
                    blurRadius: 0, // Blur radius
                    offset: Offset(0, 0.5), // Offset of the shadow
                  ),
                ],
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.4),
                    Colors.black.withOpacity(0.7),
                    Colors.black
                  ], // Half white and half black
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius:
                    BorderRadius.circular(10), // Adjust the border radius
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/dull_star.svg',
                                    width: 20,
                                  ),
                                  Text(
                                    ' 29,930',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Text(
                            profile.bigTitle!,
                            style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w800,
                                fontSize: 22,
                                color: Colors.white.withOpacity(0.9)),
                          ),
                          if (profile.tags!.isNotEmpty) ...[
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.pink.withOpacity(0.1),
                                border: Border.all(color: Colors.pinkAccent),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![0],
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.pink),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      profile.tags![1],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      profile.tags![2],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      profile.tags![5],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black,
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  profile.tags![3],
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      profile.tags![4],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      profile.tags![5],
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ] else
                            Text(
                              profile.littleTitle!,
                              style: TextStyle(
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                              ),
                            ),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                    SvgPicture.asset('assets/images/love.svg'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
