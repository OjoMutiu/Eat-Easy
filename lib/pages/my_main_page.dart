import 'dart:collection';

import 'package:eat_easy/constants/app_colors.dart';
import 'package:eat_easy/constants/app_dimensions.dart';
import 'package:eat_easy/constants/app_strings.dart';
import 'package:eat_easy/pages/home_page/my_home_page.dart';
import 'package:eat_easy/pages/profile_page/profile_page.dart';
import 'package:eat_easy/pages/search_page/search_page.dart';
import 'package:flutter/material.dart';

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  //Variables
  int _currentBottomNavitemIndex = 0;

  ///list of all navigation
  final ListQueue<int> _navigationQueue = ListQueue();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_navigationQueue.isEmpty) return true;
        setState(() {
          _currentBottomNavitemIndex = _navigationQueue.last;
          _navigationQueue.removeLast();
        });

        return false;
      },
      child: Scaffold(
        body:
            IndexedStack(index: _currentBottomNavitemIndex, children: <Widget>[
          ///the list of widgets has to be inside the body
          const MyHomePage(),
          const SearchPage(),
          Container(color: Colors.red),
          const MyProfile(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          currentIndex: _currentBottomNavitemIndex,
          onTap: (index) {
            _navigationQueue.addLast(_currentBottomNavitemIndex);
            setState(() {
              _currentBottomNavitemIndex = index;
            });
          },
          selectedItemColor: AppColors.primary50,
          unselectedItemColor: AppColors.neutral,
          unselectedLabelStyle: TextStyle(
              fontSize: AppDimension.height16,
              color: AppColors.neutral,
              fontWeight: FontWeight.w500),
          selectedLabelStyle: TextStyle(
              fontSize: AppDimension.height16,
              color: AppColors.primary50,
              fontWeight: FontWeight.w500),
          showUnselectedLabels: true,
          items: [
            const BottomNavigationBarItem(
              label: AppString.home,
              icon: BottomNavBarIcon(icon: Icon(Icons.house)),
            ),
            const BottomNavigationBarItem(
                icon: BottomNavBarIcon(icon: Icon(Icons.search)),
                label: AppString.search),
            BottomNavigationBarItem(
                icon: BottomNavBarIcon(
                  icon: CircleAvatar(
                    backgroundColor: _currentBottomNavitemIndex == 2
                        ? AppColors.primary50
                        : AppColors.neutral,
                    radius: AppDimension.height16 * 0.8,
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                      size: AppDimension.height16 * 1.2,
                    ),
                  ),
                ),
                label: AppString.recent),
            const BottomNavigationBarItem(
                icon: BottomNavBarIcon(icon: Icon(Icons.person)),
                label: AppString.profile),
          ],
        ),
      ),
    );
  }
}

class BottomNavBarIcon extends StatelessWidget {
  const BottomNavBarIcon({
    super.key,
    required this.icon,
  });

  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: AppDimension.width8 / 2,
          vertical: AppDimension.height8 / 2),
      child: icon,
    );
  }
}
