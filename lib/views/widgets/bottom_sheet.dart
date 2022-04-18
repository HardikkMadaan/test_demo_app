import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';

class ADBottomSheet extends StatelessWidget {
  const ADBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Created At'),
          trailing: (context.watch<AppProvider>().selectedSortBy == 'createdAt')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedSortBy('createdAt');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Name'),
          trailing: (context.watch<AppProvider>().selectedSortBy == 'name')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedSortBy('name');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Country'),
          trailing: (context.watch<AppProvider>().selectedSortBy == 'country')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedSortBy('country');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Employee Id'),
          trailing: (context.watch<AppProvider>().selectedSortBy == 'id')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedSortBy('id');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
