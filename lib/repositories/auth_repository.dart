import 'package:test_app/entities/entities.dart';
import 'package:test_app/https/https.dart';

abstract class IAuthRepository {
  Future<AuthUserEntity> login(String email, String password);
}

class AuthRepositoryImpl implements IAuthRepository {
  AuthRepositoryImpl();

  @override
  Future<AuthUserEntity> login(String email, String password) {
    return AuthHttp.login(email, password);
  }
}
