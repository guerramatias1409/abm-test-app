import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/screens.dart';

class NavigationHelper {
  static goToClientsScreen(BuildContext context) async {
    await Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => GetIt.instance.get<ClientsController>(),
          child: const ClientsScreen(),
        ),
      ),
    );
  }

  static goBack(BuildContext context) {
    Navigator.pop(context);
  }
}
