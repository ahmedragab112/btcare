import 'package:btcare/core/provider/notification_provider.dart';
import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:btcare/features/patient/machine/view/pages/add_alarm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Timer extends StatelessWidget {
  const Timer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Consumer<alarmprovider>(builder: (context, alarm, child) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView.builder(
                itemCount: alarm.modelist.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/images/medicn.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.fill,
                                  ),
                                  const HorizantelSpace(20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alarm.modelist[index].dateTime!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.black),
                                      ),
                                      const VerticalSpace(10),
                                      const Text(
                                        'Ring Once',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.black),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child:
                                        Text("|${alarm.modelist[index].label}"),
                                  ),
                                ],
                              ),
                              CupertinoSwitch(
                                  value: (alarm.modelist[index].milliseconds! <
                                          DateTime.now().microsecondsSinceEpoch)
                                      ? false
                                      : alarm.modelist[index].check,
                                  onChanged: (v) {
                                    alarm.EditSwitch(index, v);

                                    alarm.CancelNotification(
                                        alarm.modelist[index].id!);
                                  }),
                            ],
                          ),
                          Text(alarm.modelist[index].when!)
                        ],
                      ),
                    ),
                  );
                }),
          );
        }),
        Container(
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.centerRight,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              color: Colors.white),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const AddAlarm()));
            },
            child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xffB2B2B2), shape: BoxShape.circle),
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
