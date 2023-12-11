import 'package:test_app/databases/databases.dart';

abstract class ILocalDataRepository {
  Future<void> saveUserToken(String token);
  Future<String?> getUserToken();
}

class LocalDataRepositoryImpl implements ILocalDataRepository {
  LocalDataRepositoryImpl({required this.database});

  final LocalDatabase database;

  @override
  Future<void> saveUserToken(String token) => database.saveUserToken(token);

  @override
  Future<String?> getUserToken() => database.getUserToken();
}
