import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:test_app/entities/entities.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/helpers/helpers.dart';
import 'package:test_app/screens/clients/clients.dart';
import 'package:test_app/themes/themes.dart';

class ClientItemProvider extends StatelessWidget {
  const ClientItemProvider({
    required this.client,
    super.key,
  });

  final ClientEntity client;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GetIt.instance.get<ClientItemController>(),
      child: ClientItem(client: client),
    );
  }
}

class ClientItem extends StatelessWidget {
  const ClientItem({
    required this.client,
    super.key,
  });

  final ClientEntity client;

  @override
  Widget build(BuildContext context) {
    return Consumer<ClientItemController>(
      builder: (context, controller, _) {
        return GestureDetector(
          onTap: () => controller.changeShowEditButtonValue(value: false),
          child: Container(
            decoration: ShapeDecoration(
              color: AppThemeColors.primaryWhite,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x192BC08A),
                  blurRadius: 24,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              client.photo.isNotEmpty
                                  ? client.photo
                                  : 'https://cdn.vectorstock.com/i/preview-1x/66/14/default-avatar-photo-placeholder-profile-picture-vector-21806614.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(37.24),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${client.firstName} ${client.lastName}",
                            style: AppThemeTexts.body2(
                              color: AppThemeColors.black90,
                            ).w700,
                          ),
                          Text(
                            client.email,
                            style: AppThemeTexts.body3(
                              color: AppThemeColors.gray90,
                            ).w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                  if (controller.showEditButton)
                    ElevatedButton(
                      onPressed: () {
                        final clientPopUpController =
                            context.read<ClientPopUpController>();
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ListenableProvider.value(
                              value: clientPopUpController,
                              child: ClientPopUp(
                                client: client,
                                onCancel: () =>
                                    NavigationHelper.goBack(context),
                              ),
                            );
                          },
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          AppThemeColors.primaryBlack,
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(8),
                        ),
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            side: const BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.edit,
                            color: AppThemeColors.primaryWhite,
                            size: 20,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            ClientsStrings.edit,
                            style: AppThemeTexts.body1(
                              color: AppThemeColors.primaryWhite,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    IconButton(
                      onPressed: () => controller.changeShowEditButtonValue(),
                      icon: const Icon(
                        Icons.more_vert,
                        color: AppThemeColors.primaryBlack,
                      ),
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
