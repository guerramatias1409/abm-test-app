import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:test_app/entities/entities.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/helpers/helpers.dart';
import 'package:test_app/screens/clients/clients.dart';
import 'package:test_app/themes/themes.dart';
import 'package:test_app/widgets/widgets.dart';

class ClientPopUp extends StatefulWidget {
  const ClientPopUp({
    required this.onCancel,
    this.client,
    super.key,
  });

  final ClientEntity? client;
  final VoidCallback onCancel;

  @override
  State<ClientPopUp> createState() => _ClientPopUpState();
}

class _ClientPopUpState extends State<ClientPopUp> {
  @override
  void initState() {
    context.read<ClientPopUpController>().setData(widget.client);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ClientPopUpController>().update();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var isActionSucceded = context.select<ClientPopUpController, bool>(
      (controller) => controller.actionSucceded,
    );

    if (isActionSucceded) {
      NavigationHelper.goBack(context);
    }

    return Consumer<ClientPopUpController>(
      builder: (context, controller, _) {
        return Dialog(
          insetPadding: const EdgeInsets.all(40),
          surfaceTintColor: AppThemeColors.primaryWhite,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  controller.selectedClient != null
                      ? ClientsStrings.editClient
                      : ClientsStrings.addClient,
                  style: AppThemeTexts.h6(
                    color: AppThemeColors.generalBlackHighEmphasis,
                  ),
                ),
                const SizedBox(height: 48),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    DottedBorder(
                      borderType: BorderType.Circle,
                      dashPattern: const [6, 6],
                      strokeWidth: 1.5,
                      color: AppThemeColors.maximumGreenYelow,
                      child: const SizedBox(
                        height: 119,
                        width: 119,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/fi-rr-mode-landscape.svg',
                          height: 30,
                          width: 30,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          ClientsStrings.uploadImage,
                          style: AppThemeTexts.body2(
                            color: AppThemeColors.generalBlackDisabled,
                          ).w400,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                MyInputField(
                  hintText: '${ClientsStrings.firstName}*',
                  controller: controller.firstNameController,
                ),
                const SizedBox(height: 12),
                MyInputField(
                  hintText: '${ClientsStrings.lastName}*',
                  controller: controller.lastNameController,
                ),
                const SizedBox(height: 12),
                MyInputField(
                  hintText: '${ClientsStrings.email}*',
                  controller: controller.emailController,
                ),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextButton(
                      label: ClientsStrings.cancel,
                      onPressed: widget.onCancel,
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: controller.error != null
                          ? AppText.body2(
                              label: controller.error!,
                              textAlign: TextAlign.center,
                            )
                          : MyElevatedButton(
                              isLoading: controller.isLoading,
                              label: ClientsStrings.save.toUpperCase(),
                              onPressed: () => controller.saveAction(),
                            ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
