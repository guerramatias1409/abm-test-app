import 'package:tots_core/tots_core.dart';
import 'package:test_app/entities/user.dart';
import 'package:test_app/utils/exceptions.dart';

class AuthHttp {
  static Future<AuthUserEntity> login(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      await Future.delayed(const Duration(seconds: 1)).then((value) {
        throw FetchDataException(
          message: 'Look again, you are missing email or password!',
        );
      });
    }
    return await TotsHttp.post(
      '/mia-auth/login',
      {
        'email': email,
        'password': password,
      },
      (data) {
        if (data['error'] != null) {
          throw FetchDataException(message: data['error']['message'] ?? '');
        }
        return AuthUserEntity.fromJson(data['response']);
      },
    );
  }
}
