import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/screens.dart';
import 'package:test_app/widgets/widgets.dart';

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ClientsController>().loadClients();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const MyPageTemplate(
      pageBody: ClientScreenProvider(),
      pageBottomBar: ClientsPageBottomBar(),
    );
  }
}
