import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';

class ADDialog extends StatelessWidget {
  const ADDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: context.read<AppProvider>().setSelectedSearch,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.read<AppProvider>().searchData();
            Navigator.pop(context);
          },
          child: const Text('Okay'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Cancel'),
        )
      ],
    );
  }
}
