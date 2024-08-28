import 'dart:async';
import 'dart:developer';

import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/data/models/drawer_model.dart';
import 'package:btcare/features/patient/machine/view/pages/chat.dart';
import 'package:btcare/features/patient/machine/view/pages/home.dart';
import 'package:btcare/features/patient/machine/view/pages/profile_details.dart';
import 'package:btcare/features/patient/machine/view/pages/scan.dart';
import 'package:btcare/features/patient/machine/view/pages/timer.dart' as timer;
import 'package:btcare/features/patient/machine/view/widgets/bottom_naviteam.dart';
import 'package:btcare/features/patient/machine/view/widgets/drawer_iteam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/provider/notification_provider.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int index = 0;
  List<Widget> pages = const [Home(), Scan(),timer.Timer(), Chat()];
  final GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
     context.read<alarmprovider>().Inituilize(context);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });

    super.initState();
    context.read<alarmprovider>().GetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        endDrawer: Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Setting',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff3F3F3F),
                ),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(45),
              Row(
                children: [
                  Image.asset(
                    'assets/images/doctor.png',
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.fill,
                  ),
                  const HorizantelSpace(10),
                  const Text(
                    'Mohamed Ahmed',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      context.push(const ProfileDetails());
                    },
                  )
                ],
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => DrawerIteam(
                          iconData: draweIteam[index].icon,
                          txt: draweIteam[index].txt,
                          onPressed: draweIteam[index].onPressed,
                          logOut: draweIteam[index].logOut,
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          color: Color(0xffDFDFDF),
                        ),
                    itemCount: draweIteam.length),
              )
            ],
          ).setPadding(context, horizontal: 10, vertical: 20),
        ),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                log('test');
                key.currentState?.openEndDrawer();
              },
            ),
          ],
          leadingWidth: double.infinity,
          backgroundColor: const Color(0xff03A1A4),
          leading: Row(
            children: [
              Image.asset(
                'assets/images/brain.png',
                width: 50,
                height: 50,
                fit: BoxFit.fitWidth,
              ),
              const HorizantelSpace(10),
              const Text(
                'BT CARE',
                style: TextStyle(
                    color: Color(0xffF2F2F2),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        body: pages[index],
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: index,
            backgroundColor: Colors.white,
            elevation: 0.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              index = value;
              setState(() {});
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: BottomNavIteam(
                  icon: Icon(
                    Icons.home,
                    color: Color(0xff858EA9),
                  ),
                ),
                activeIcon: BottomNavIteam(
                  icon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  active: true,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BottomNavIteam(
                  icon: Icon(
                    Icons.document_scanner_rounded,
                    color: Color(0xff858EA9),
                  ),
                ),
                activeIcon: BottomNavIteam(
                  icon: Icon(
                    Icons.document_scanner_rounded,
                    color: Colors.white,
                  ),
                  active: true,
                ),
                label: 'Scan',
              ),
              BottomNavigationBarItem(
                icon: BottomNavIteam(
                  icon: Icon(
                    Icons.watch_later,
                    color: Color(0xff858EA9),
                  ),
                ),
                activeIcon: BottomNavIteam(
                  icon: Icon(
                    Icons.watch_later,
                    color: Colors.white,
                  ),
                  active: true,
                ),
                label: 'Timer',
              ),
              BottomNavigationBarItem(
                icon: BottomNavIteam(
                  icon: Icon(
                    Icons.message,
                    color: Color(0xff858EA9),
                  ),
                ),
                activeIcon: BottomNavIteam(
                  icon: Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  active: true,
                ),
                label: 'Chat',
              ),
            ],
          ),
        ));
  }
}
