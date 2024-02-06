import 'package:flutter/material.dart';
import 'package:weather_app/widgets/default_sized_box.dart';

class NextFiveDays extends StatelessWidget {
  final String day;
  final int temp;
  final Widget cloudIcon;
  const NextFiveDays({super.key,
    required this.day,
    required this.temp,
    required this.cloudIcon
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(day.substring(0,3),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20
        ),),
        const DefaultSizedBox.vertical(10),
        SizedBox(
            height: 30,
            width: 30,
            child: cloudIcon),
        const DefaultSizedBox.vertical(10),
        Text('$temp',
          style: const TextStyle(
              color: Colors.white,
              fontSize: 20
          ),),
      ],
    );
  }
}
