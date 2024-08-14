import 'package:flutter/material.dart';
import 'package:movie_localization/strings.g.dart';

class MovieBottomNavigationBar extends StatefulWidget {
  const MovieBottomNavigationBar({super.key, required this.pageController});

  final PageController pageController;

  @override
  State<MovieBottomNavigationBar> createState() =>
      MovieBottomNavigationBarState();
}

class MovieBottomNavigationBarState extends State<MovieBottomNavigationBar> {
  var _currenPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currenPageIndex,
      onTap: (index) {
        widget.pageController.jumpToPage(index);
        setState(() {
          _currenPageIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: const Icon(Icons.home), 
            label: context.t.main.tabs.home),
        BottomNavigationBarItem(
            icon: const Icon(Icons.search), 
             label: context.t.main.tabs.search),
        BottomNavigationBarItem(
            icon: const Icon(Icons.slow_motion_video),
            label: context.t.main.tabs.video),
        BottomNavigationBarItem(
            icon: const Icon(Icons.person_pin),
            label: context.t.main.tabs.profile),
      ],
    );
  }
}
