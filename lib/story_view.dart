import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {

  final controller = StoryController();

  @override
  Widget build(context) {
  List<StoryItem> storyItems = [
  StoryItem.text(title: 'First Story', backgroundColor: Colors.black,),
  StoryItem.pageImage(url: "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=465&q=80", controller: controller,),

  ]; // your list of stories

  return StoryView(
    storyItems : storyItems,
    controller: controller, // pass controller here too
    repeat: true, // should the stories be slid forever
    onComplete: () {},
    onVerticalSwipeComplete: (direction) {
    if (direction == Direction.down) {
    Navigator.pop(context);
    }
    } // To disable vertical swipe gestures, ignore this parameter.
    // Preferrably for inline story view.
    );
  }
}
