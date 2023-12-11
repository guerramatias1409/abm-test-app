import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:tots_core/tots_core.dart';
import 'package:test_app/helpers/helpers.dart';
import 'package:test_app/screens/login/login.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  TotsHttp.instance.options.baseUrl = dotenv.env['API_BASE_URL']!;

  await DIHelper().configureInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ABM Test App',
      home: ChangeNotifierProvider(
        create: (context) => GetIt.instance.get<LoginController>(),
        child: const LoginScreen(),
      ),
    );
  }
}
