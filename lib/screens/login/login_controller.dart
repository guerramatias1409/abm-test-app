import 'package:flutter/material.dart';
import 'package:test_app/helpers/helpers.dart';
import 'package:test_app/repositories/auth_repository.dart';
import 'package:test_app/repositories/local_data_repository.dart';
import 'package:test_app/utils/exceptions.dart';

class LoginController extends ChangeNotifier {
  LoginController({
    required this.authRepository,
    required this.localDataRepository,
  });

  final IAuthRepository authRepository;
  final ILocalDataRepository localDataRepository;

  bool isPasswordHidden = false;
  bool isLoading = false;
  String? error;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void init(BuildContext context) async {
    final userToken = await localDataRepository.getUserToken();
    if (userToken != null) {
      if (!context.mounted) return;
      navigateToClientsScreen(context);
    }
    return;
  }

  changeShowPasswordValue() {
    clearError();
    isPasswordHidden = !isPasswordHidden;
    notifyListeners();
  }

  loginButtonPressed(BuildContext context) async {
    showLoading();
    clearError();
    try {
      final response = await authRepository.login(
        emailController.text,
        passwordController.text,
      );

      localDataRepository.saveUserToken(response.accessToken);
      if (!context.mounted) return;
      navigateToClientsScreen(context);
      // isUserLogged = true;
      // notifyListeners();
    } on FetchDataException catch (e) {
      setError(e.toString());
    } catch (e) {
      setError('Error loading info. Please try again later...');
    } finally {
      hideLoading();
    }
  }

  navigateToClientsScreen(BuildContext context) {
    NavigationHelper.goToClientsScreen(context);
  }

  clearError() {
    error = null;
    notifyListeners();
  }

  setError(String message) {
    error = message;
    notifyListeners();
  }

  showLoading() {
    isLoading = true;
    notifyListeners();
  }

  hideLoading() {
    isLoading = false;
    notifyListeners();
  }
}
