import 'dart:developer';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartmeter/constants/globalVar.dart';
import 'package:smartmeter/screens/billHistory.dart';
import 'package:smartmeter/screens/complaintScreen.dart';
import 'package:smartmeter/screens/homescreen.dart';
import 'package:smartmeter/screens/profile.dart';
import 'package:smartmeter/services/userProfile.dart';
import 'package:smartmeter/services/viewbillHistory.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  void initState() {
    initCall();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
    const HomeScreen(),
    ProfileThreePage(),
    ComplaintsScreen(),
    BillHistory(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
            bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Color.fromARGB(255, 202, 206, 210),
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
              notchColor: Colors.black87,

              /// restart app if you change removeMargins
              removeMargins: false,
              bottomBarWidth: 500,
              showShadow: false,
              durationInMilliSeconds: 300,
              elevation: 1,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.energy_savings_leaf,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 4',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.history,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.history,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Page 5',
                ),
              ],
              onTap: (index) {
                /// perform action on tab change and to update pages you can update pages without pages
                log('current selected index $index');
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }

  //getprofile
  getProfile() async{
    final pro = await getUserProfile();
    if (pro != null) {
      profile = pro;
    }
  }

  //getBillhistory
  getbillHistory() async{
    final pro = await viewbillhistoryApi();
    if (pro != null) {
      billHistory = pro;
    }
  }

  initCall() async{
    await getProfile();
    await getbillHistory();
  }
}

