import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/extensions/extensions.dart';
import 'package:test_app/screens/login/login.dart';
import 'package:test_app/themes/themes.dart';
import 'package:test_app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyPageTemplate(
      pageBody: LogInScreenBody(),
    );
  }
}

class LogInScreenBody extends StatefulWidget {
  const LogInScreenBody({super.key});

  @override
  State<LogInScreenBody> createState() => _LogInScreenBodyState();
}

class _LogInScreenBodyState extends State<LogInScreenBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<LoginController>().init(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var error = context.select<LoginController, String?>(
      (LoginController controller) => controller.error,
    );

    if (error != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        MySnackBar().show(context, message: error);
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/login_logo.png'),
          Text(
            LoginStrings.login.toUpperCase(),
            textAlign: TextAlign.center,
            style: AppThemeTexts.body3().w700,
          ),
          const SizedBox(height: 34),
          Consumer<LoginController>(
            builder: (context, controller, _) {
              return MyInputField(
                hintText: LoginStrings.email,
                controller: controller.emailController,
              );
            },
          ),
          const SizedBox(height: 23),
          Consumer<LoginController>(
            builder: (context, controller, _) {
              return MyInputField(
                hintText: LoginStrings.password,
                controller: controller.passwordController,
                obscureText: controller.isPasswordHidden,
                onSuffixIconPressed: () {
                  controller.changeShowPasswordValue();
                },
                suffixIcon: controller.isPasswordHidden
                    ? Icons.visibility_rounded
                    : Icons.visibility_off,
              );
            },
          ),
          const SizedBox(height: 60),
          Consumer<LoginController>(
            builder: (context, controller, _) {
              return MyElevatedButton(
                label: LoginStrings.login.toUpperCase(),
                textVerticalPadding: 14,
                isLoading: controller.isLoading,
                onPressed: () {
                  controller.loginButtonPressed(context);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
