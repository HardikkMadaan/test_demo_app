import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/views/widgets/bottom_sheet.dart';
import 'package:test_demo_app/views/widgets/bottom_sheet_order.dart';
import 'package:test_demo_app/views/widgets/dialog.dart';
import 'package:test_demo_app/views/widgets/list_tile.dart';

import '../provider/app_provider.dart';

class EmployeeDetails extends StatelessWidget {
  const EmployeeDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.sort,
              color: Colors.black,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const BTSheet();
                },
              ).then((value) {
                context.read<AppProvider>().fetchEmployeeList(
                      page: 1,
                      isRefresh: true,
                    );
              });
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.filter_alt_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return const ADBottomSheet();
                  },
                ).then((value) {
                  context.read<AppProvider>().fetchEmployeeList(
                        page: 1,
                        isRefresh: true,
                      );
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const ADDialog();
                    });
              },
            ),
          ],
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
          title: const Text(
            'Employee List',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0.0,
        ),
        body: Consumer<AppProvider>(
          builder: (context, model, _) {
            return (model.employeeList != null)
                ? ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    controller: model.scrollController,
                    itemCount: model.employeeList!.employeeList.length + 1,
                    itemBuilder: (BuildContext context, index) {
                      if (index == model.employeeList!.employeeList.length) {
                        return (model.isLoading)
                            ? Column(
                                children: const [
                                  CupertinoActivityIndicator(),
                                  SizedBox(
                                    height: 25,
                                  )
                                ],
                              )
                            : const SizedBox(
                                height: 50.0,
                              );
                      } else {
                        return ADListTile(
                          employeeData: model.employeeList!.employeeList[index],
                        );
                      }
                    },
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
