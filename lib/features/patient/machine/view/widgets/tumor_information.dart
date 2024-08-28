import 'package:btcare/core/utils/spaceing/spaceing.dart';
import 'package:flutter/material.dart';

class TumorInformation extends StatefulWidget {
  const TumorInformation(
      {super.key, required this.txt1, required this.image, required this.txt2});
  final String txt1;
  final String txt2;
  final String image;

  @override
  State<TumorInformation> createState() => _TumorInformationState();
}

class _TumorInformationState extends State<TumorInformation> {
  bool readMore = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xff03A1A4).withOpacity(.50),
        ),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Image.asset(
            widget.image,
            width: 180,
            height: 180,
            fit: BoxFit.fill,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.txt1,
                style: const TextStyle(
                  fontSize: 20,
                  color: Color(0xff03A1A4),
                ),
              ),
              const VerticalSpace(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      widget.txt2,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                      maxLines: readMore == true ? null : 3,
                    ),
                  ),
                  Expanded(child: Container())
                ],
              ),
              const VerticalSpace(20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Color(0xff03A1A4),
                    ),
                  ),
                ),
                onPressed: () {
                  readMore = !readMore;
                  setState(() {});
                },
                child: const Text(
                  'Read more',
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
