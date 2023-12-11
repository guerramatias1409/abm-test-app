import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/helpers/helpers.dart';
import 'package:test_app/screens/screens.dart';
import 'package:test_app/themes/themes.dart';
import 'package:test_app/widgets/widgets.dart';

class ClientScreenProvider extends StatelessWidget {
  const ClientScreenProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider<ClientPopUpController>(
      create: (context) => GetIt.instance.get<ClientPopUpController>(),
      child: const ClientsScreenBody(),
    );
  }
}

class ClientsScreenBody extends StatelessWidget {
  const ClientsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var selectedValue = context.select(
      (ClientPopUpController controller) => controller.actionSucceded,
    );
    if (selectedValue) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.read<ClientsController>().loadClients();
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/clients_logo.png'),
          Text(
            textAlign: TextAlign.start,
            ClientsStrings.clients.toUpperCase(),
            style: AppThemeTexts.h5().w700,
          ),
          Row(
            children: [
              MySearchBar(
                hintText: ClientsStrings.search,
                preffixIcon: Icons.search,
                onChanged: (value) =>
                    context.read<ClientsController>().filterList(value),
              ),
              const SizedBox(width: 18),
              MyElevatedButton(
                label: ClientsStrings.addNew.toUpperCase(),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) {
                      return ListenableProvider.value(
                        value: context.read<ClientPopUpController>(),
                        child: ClientPopUp(
                          onCancel: () => NavigationHelper.goBack(context),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Consumer<ClientsController>(
                  builder: (context, controller, _) {
                if (controller.error != null) {
                  return Center(
                    child: AppText.body1(label: controller.error!),
                  );
                }

                if (controller.isLoading && controller.clientsList.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppThemeColors.primaryBlack,
                    ),
                  );
                }

                if (controller.showFilteredList) {
                  return controller.filteredClients.isEmpty
                      ? Center(
                          child: AppText.body1(
                              label: 'There are no results for your search.'),
                        )
                      : ListView.builder(
                          itemCount: controller.filteredClients.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ClientItemProvider(
                                client: controller.filteredClients[index],
                              ),
                            );
                          },
                        );
                }

                return ListView.builder(
                  controller: controller.listScrollController,
                  itemCount: controller.visibleItemsCount,
                  itemBuilder: (context, index) {
                    if (index >= controller.clientsList.length) {
                      return const SizedBox.shrink();
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ClientItemProvider(
                        client: controller.clientsList[index],
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
