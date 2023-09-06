import 'dart:developer';
import 'package:luvit/model/profile.dart';
import 'package:luvit/services/firebase_service.dart';
import 'package:luvit/services/get_data.dart';
import 'package:luvit/widgets/drag_widget.dart';
import 'package:flutter/material.dart';
import '../services/data_service.dart';
import '../utils/common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  getData() async {
    await FirebaseData().changeDataInFirebase();
    await DatabaseService().readAllData('data');
  }

  List<Profile> draggableItems = [];

  int currentIndex = 0;
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    draggableItems = GetimageData().getDataImage();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reset();
        setState(() {
          currentIndex = 0;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (draggableItems.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('추천 드릴 친구들을 준비 중이에요',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('매일 새로운 친구들을 소개시켜드려요',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
            ],
          ),
        ],
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: GestureDetector(
            onTapUp: (details) {
              final cardWHeight = MediaQuery.of(context).size.height;
              final cardWidth = MediaQuery.of(context).size.width;
              final tapPositionHeight = details.localPosition.dy;
              final tapPositionWidth = details.localPosition.dx;
              final middlePointWidth = cardWidth / 2;
              final middlePointHeight = cardWHeight / 2;
              if (tapPositionHeight < middlePointHeight &&
                  tapPositionWidth > middlePointWidth) {
                swipeRight();
                log('tapping right upside');
              } else if (tapPositionHeight < middlePointHeight &&
                  tapPositionWidth < middlePointWidth) {
                swipeLeft();
                log('tapping left upside');
              }
            },
            child: DragWidget(
              draggableItems: (val) {
                draggableItems.removeAt(val);
                setState(() {});
              },
              profile: draggableItems[currentIndex],
              index: currentIndex,
              swipeNotifier: ValueNotifier(Swipe.none),
              isLastCard: currentIndex == draggableItems.length - 1,
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 60,
          child: Row(
            children: List.generate(
              draggableItems.length,
              (index) => Container(
                width: 80, // Customize the width of the status indicator bar
                height: 4, // Customize the height of the status indicator bar
                color: index < draggableItems.length
                    ? (index == currentIndex ? Colors.pink : Colors.black)
                    : Colors.transparent, // Customize the colors
                margin:
                    EdgeInsets.only(right: 10), // Adjust spacing between bars
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 60,
            left: 180,
            child: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            )),
      ],
    );
  }

  void swipeLeft() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    } else {
      _animationController.forward();
    }
  }

  void swipeRight() {
    if (currentIndex < draggableItems.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      _animationController.forward();
    }
  }
}
