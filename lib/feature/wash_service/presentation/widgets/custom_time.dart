import 'package:car_wash/core/utilities/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTime extends StatefulWidget {
  const CustomTime({
    super.key,
  });

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  Color backgroundColor = AppColor.greyColor;
  List<bool> isSelected = [false, false, false]; // for 3 containers

  void handleTap(int index) {
    setState(() {
      for (int i = 0; i < isSelected.length; i++) {
        if (i == index) {
          isSelected[i] = true;
        } else {
          isSelected[i] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      GestureDetector(
        onTap: () {
          handleTap(0);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[0] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("11:30 AM"),
        ),
      ),
      GestureDetector(
        onTap: () {
          handleTap(1);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[1] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("12:30 PM"),
        ),
      ),
      GestureDetector(
        onTap: () {
          handleTap(2);
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected[2] ? Colors.blue : backgroundColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Text("01:30 PM"),
        ),
      ),
    ]);
  }
}
