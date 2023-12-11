import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/screens.dart';
import 'package:test_app/widgets/widgets.dart';

class ClientsPageBottomBar extends StatelessWidget {
  const ClientsPageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientsController>(
      builder: (context, controller, _) {
        if (controller.error != null ||
            (controller.isLoading && controller.clientsList.isEmpty)) {
          return const SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              MyElevatedButton(
                label: ClientsStrings.loadMore.toUpperCase(),
                textVerticalPadding: 14,
                onPressed: () => controller.showMoreClients(),
              ),
            ],
          ),
        );
      },
    );
  }
}
