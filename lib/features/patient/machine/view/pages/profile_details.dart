import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/extention/extentions.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff03A1A4),
      extendBody: true,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/arrow.png'),
                ),
                const Spacer(),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * .7,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(16),
                              topLeft: Radius.circular(16))),
                      child: Column(
                        children: [
                          const VerticalSpace(100),
                          TextFormField(
                            initialValue: CacheHelper().getString('userName'),
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                              borderSide: BorderSide(
                                  color: Color(0xff03A1A4), width: 1),
                            )),
                          ),
                          const VerticalSpace(30),
                          TextFormField(
                            initialValue: CacheHelper().getString('email'),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(12),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xff03A1A4), width: 1),
                              ),
                            ),
                          )
                        ],
                      ).setPadding(context, horizontal: 20, vertical: 10),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 100,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  const CircleAvatar(
                    maxRadius: 80,
                    backgroundImage: AssetImage('assets/images/doctor.png'),
                    backgroundColor: Colors.white,
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xff03A1A4)),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
