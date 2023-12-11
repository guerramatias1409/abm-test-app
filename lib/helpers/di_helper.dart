import 'package:get_it/get_it.dart';
import 'package:test_app/databases/databases.dart';
import 'package:test_app/repositories/repositories.dart';
import 'package:test_app/screens/screens.dart';

class DIHelper {
  Future<void> configureInjection() async {
    GetIt getIt = GetIt.instance;

    //Database
    getIt.registerLazySingleton<LocalDatabase>(
      () => LocalDatabase(),
    );

    //Repositories
    getIt.registerLazySingleton<IClientsRepository>(
      () => ClientsRepositoryImpl(),
    );
    getIt.registerLazySingleton<IAuthRepository>(
      () => AuthRepositoryImpl(),
    );
    getIt.registerLazySingleton<ILocalDataRepository>(
      () => LocalDataRepositoryImpl(
        database: getIt.get<LocalDatabase>(),
      ),
    );

    //Controllers
    getIt.registerLazySingleton<LoginController>(
      () => LoginController(
        authRepository: getIt.get<IAuthRepository>(),
        localDataRepository: getIt.get<ILocalDataRepository>(),
      ),
    );
    getIt.registerLazySingleton<ClientsController>(
      () => ClientsController(repository: getIt.get<IClientsRepository>()),
    );

    getIt.registerLazySingleton<ClientPopUpController>(
      () => ClientPopUpController(repository: getIt.get<IClientsRepository>()),
    );

    getIt.registerFactory<ClientItemController>(() => ClientItemController());

    await getIt.allReady();
  }
}
