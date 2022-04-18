
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';
import 'package:test_demo_app/views/employee_details.dart';
import 'package:test_demo_app/views/profile_screen.dart';
import 'package:test_demo_app/views/tab_handler.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: const SafeArea(
          child: Padding(
            child: TabHandler(),
            padding: EdgeInsets.all(
              20.0,
            ),
          ),
        ),
      ),
      body: (context.watch<AppProvider>().tabIndex == 0)
          ? const EmployeeDetails()
          : const ProfileScreen(),
    );
  }
}
