import 'package:flutter/material.dart';
import 'package:test_demo_app/models/checkIn.dart';

class CheckInTile extends StatelessWidget {
  final CheckIn checkInData;

  const CheckInTile({
    Key? key,
    required this.checkInData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Text(
          checkInData.id!,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        title: Text(checkInData.purpose ?? ''),
        subtitle: Text(checkInData.location ?? ''),
        onTap: () {},
      ),
    );
  }
}
