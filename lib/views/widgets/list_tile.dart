import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_demo_app/models/employee.dart';
import 'package:test_demo_app/views/employee_checkin.dart';

class ADListTile extends StatelessWidget {
  final Employee employeeData;

  const ADListTile({
    Key? key,
    required this.employeeData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundImage: NetworkImage(employeeData.avatar!),
        ),
        title: Text(employeeData.name ?? ''),
        subtitle: Text(employeeData.email ?? ''),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => EmployeeCheckIn(
                id: employeeData.id!,
              ),
            ),
          );
        },
      ),
    );
  }
}
