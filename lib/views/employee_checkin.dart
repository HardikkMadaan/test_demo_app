import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/check_in_provider.dart';
import 'package:test_demo_app/views/widgets/check_in_tile.dart';

class EmployeeCheckIn extends StatelessWidget {
  final String id;

  const EmployeeCheckIn({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CheckInProvider>(
      create: (_) => CheckInProvider(id),
      child: Consumer<CheckInProvider>(
        builder: (context, model, _) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              centerTitle: true,
              backgroundColor: Colors.grey.shade300,
              title: const Text(
                'CheckIn List',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              elevation: 0.0,
            ),
            body: (model.getCheckInList != null)
                ? ListView.builder(
                    itemCount: model.getCheckInList!.checkInList.length,
                    itemBuilder: (context, index) {
                      final data = model.getCheckInList!.checkInList[index];
                      return CheckInTile(
                        checkInData: data,
                      );
                    },
                  )
                : const Center(
                    child: CupertinoActivityIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
