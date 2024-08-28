import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/auth/view/widget/custom_type_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/machine_cubit.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var data = context.read<HomeCubit>();
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const VerticalSpace(100),
                      Image.asset(
                        'assets/images/arrow.png',
                        width: 60,
                        fit: BoxFit.fill,
                        height: 60,
                      ),
                      const VerticalSpace(20),
                      Row(
                        children: [
                          Image.network(
                            '',
                            width: 100,
                            height: 100,
                            errorBuilder: (context, error, stackTrace) =>
                                Image.asset(
                              'assets/images/doctor.png',
                              width: 74,
                              height: 74,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const HorizantelSpace(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.doctorDetailsModel?.username ?? '',
                                style: const TextStyle(color: Colors.black),
                              ),
                              const VerticalSpace(20),
                              const Text(
                                'General | RSUD Gatot Subroto',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                      const VerticalSpace(50),
                      const TabBar(tabs: [
                        Tab(
                          text: 'About ',
                        ),
                        Tab(
                          text: 'Location',
                        )
                      ]),
                      const VerticalSpace(50),
                    ],
                  ),
                ),
                SliverFillRemaining(
                  child: Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'About me',
                              style: TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(20),
                            Text(
                              data.doctorDetailsModel?.about ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            const Text(
                              'Working Time',
                              style: TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            Text(
                              data.doctorDetailsModel?.workingTime ?? '',
                              style: const TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            const Text(
                              'Pengalaman Praktik',
                              style: TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            const Text(
                              'RSPAD Gatot Soebroto',
                              style: TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            const Text(
                              'RSPAD Batam',
                              style: TextStyle(color: Colors.black),
                            ),
                            const VerticalSpace(10),
                            CustomButton(
                                onTap: () async {
                                  await data
                                      .addChat(data.doctorDetailsModel!.id!)
                                      .then((value) {
                                    Navigator.pop(context);
                                  });
                                },
                                widget: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Chat with doctor'),
                                    HorizantelSpace(20),
                                    Icon(Icons.chat, color: Colors.white)
                                  ],
                                ))
                          ],
                        ),
                        const Center(
                          child: Text('Location : Fayoum'),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
