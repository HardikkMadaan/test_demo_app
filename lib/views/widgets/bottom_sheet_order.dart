import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_demo_app/provider/app_provider.dart';

class BTSheet extends StatelessWidget {
  const BTSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: const Text('Ascending'),
          trailing: (context.watch<AppProvider>().selectedOrderBy == 'asc')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedOrderBy('asc');
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text('Descending'),
          trailing: (context.watch<AppProvider>().selectedOrderBy == 'desc')
              ? const Icon(Icons.done)
              : null,
          onTap: () {
            context.read<AppProvider>().setSelectedOrderBy('desc');
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
