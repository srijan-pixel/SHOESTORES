import '/constant/color_properties.dart';
import '/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<Widget> pages;

  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.pages,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> _offsetAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 250,
      ),
    );

    _offsetAnimation =
        Tween<Offset>(begin: const Offset(-5.0, 0), end: Offset.zero)
            .animate(CurvedAnimation(
      curve: Curves.easeInOutCubic,
      parent: controller,
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: SlideTransition(
          position: _offsetAnimation,
          child: widget.pages[widget.currentIndex],
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(SizeConfig.widthMultiplier * 6.0),
            topRight: Radius.circular(SizeConfig.widthMultiplier * 6.0),
          ),
          child: BottomNavigationBar(
            currentIndex: widget.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: primaryColor,
            elevation: 1.0,
            iconSize: SizeConfig.widthMultiplier * 5.0,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(
                  CupertinoIcons.house,
                ),
                label: 'HOME',
                activeIcon: CircleAvatar(
                  child: const Icon(
                    CupertinoIcons.house_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                  minRadius: SizeConfig.widthMultiplier * 5.0,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.heart),
                label: 'FAV',
                activeIcon: CircleAvatar(
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                  minRadius: SizeConfig.widthMultiplier * 5.0,
                ),
              ),
              BottomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person_alt_circle),
                label: 'PROFILE',
                activeIcon: CircleAvatar(
                  child: const Icon(
                    CupertinoIcons.person_alt_circle_fill,
                    color: secondaryColor,
                  ),
                  backgroundColor: colorWhite,
                  minRadius: SizeConfig.widthMultiplier * 5.0,
                ),
              ),
            ],
            onTap: (x) {
              controller.value = 0;
              // controller.reverse();
              controller.forward();
              widget.onTap(x);
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavBar {
  String? title;
  Icon? icon;
  BottomNavBar({this.title, this.icon});
}
