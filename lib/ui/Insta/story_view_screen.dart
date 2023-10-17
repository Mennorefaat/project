

import 'package:flutter/cupertino.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/utils.dart';
import 'package:story_view/widgets/story_view.dart';
class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  State<StoryViewScreen> createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {

  final controller = StoryController();

  @override
  Widget build(BuildContext context) {
    List<StoryItem> storyItems = [
      StoryItem.text(title: 'Welcome to my Story', backgroundColor: CupertinoColors.black),
      StoryItem.pageImage(
          url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_BJQdD4ybTfV67ABVAwRhRd_o6TSM6wQYJgs7EbPqpUZ-0TU_V1GENzXZcTBkrSmufOc&usqp=CAU',
    controller: StoryController()),
      StoryItem.pageImage(url: 'https://www.thewowstyle.com/wp-content/uploads/2015/03/interior-design-photohouse-design-interior-decorating-ideas-qt6rqt58-Good-looking-Decoration-Inspiration-Good-looking-prom-decor-ideas-Industrial-Style.jpg',
          controller: StoryController()),

    ]; // your list of stories

    return StoryView(
      storyItems: storyItems,
      controller: controller,
      // pass controller here too
      repeat: false,
      // should the stories be slid forever
      onStoryShow: (s) {
        //notifyServer(s)},
      },
      onComplete: () {
        Navigator.pop(context);
      },
      onVerticalSwipeComplete: (direction) {
        if (direction == Direction.down) {
          Navigator.pop(context);
        }
      },);
  }
}


