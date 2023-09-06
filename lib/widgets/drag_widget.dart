import 'dart:developer' as dev;
import 'package:luvit/model/profile.dart';
import 'package:luvit/widgets/profile_card.dart';
import 'package:flutter/material.dart';

import '../utils/common.dart';

class DragWidget extends StatefulWidget {
  const DragWidget({
    Key? key,
    required this.profile,
    required this.index,
    required this.draggableItems,
    required this.swipeNotifier,
    this.isLastCard = false,
  }) : super(key: key);
  final Profile profile;
  final int index;
  final Function draggableItems;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        // Data is the value this Draggable stores.
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: widget.swipeNotifier.value != Swipe.none
                    ? widget.swipeNotifier.value == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: ProfileCard(profile: widget.profile),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            dev.log('bottomsss');
            // widget.swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            dev.log('left');
            widget.swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          // widget.swipeNotifier.value = Swipe.none;

          final dx = drag..offset.dx;
          final dy = drag.offset.dy;
          final dragThreshold = 100.0; // Adjust this threshold as needed

          if (dy > dragThreshold) {
            // Swiped to the bottom
            widget.swipeNotifier.value = Swipe.bottom;
            // Remove the card from the list
            dev.log('bottom');
            widget.draggableItems(widget.index);
          } else if (dx.offset.dx < -dragThreshold) {
            // Swiped to the left
            dev.log('left');
            //   widget.swipeNotifier.value = Swipe.left;
            // Remove the card from the list
            widget.draggableItems(widget.index);
          } else {
            // Not a valid swipe
            widget.swipeNotifier.value = Swipe.none;
          }
        },

        childWhenDragging: Container(
          color: Colors.transparent,
        ),

        //This will be visible when we press action button
        child: ValueListenableBuilder(
            valueListenable: widget.swipeNotifier,
            builder: (BuildContext context, Swipe swipe, Widget? child) {
              return ProfileCard(profile: widget.profile);
            }),
      ),
    );
  }
}
