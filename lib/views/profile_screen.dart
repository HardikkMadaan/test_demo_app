import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  final textStyle = const TextStyle(
    fontSize: 14.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade300,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
      ),
      body: (context.read<AppProvider>().employeeList?.employeeList[0].avatar !=
              null)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      context
                              .read<AppProvider>()
                              .employeeList
                              ?.employeeList[0]
                              .avatar ??
                          '',
                    ),
                    radius: 70.0,
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    context
                            .read<AppProvider>()
                            .employeeList
                            ?.employeeList[0]
                            .name ??
                        '',
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    context
                            .read<AppProvider>()
                            .employeeList
                            ?.employeeList[0]
                            .email ??
                        '',
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    context
                            .read<AppProvider>()
                            .employeeList
                            ?.employeeList[0]
                            .phone ??
                        '',
                    style: textStyle,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    context
                            .read<AppProvider>()
                            .employeeList
                            ?.employeeList[0]
                            .country ??
                        '',
                    style: textStyle,
                  ),
                ],
              ),
            )
          : const Center(
              child: Text('No Data Found.'),
            ),
    );
  }
}
