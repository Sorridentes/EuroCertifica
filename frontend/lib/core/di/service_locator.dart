import 'package:frontend/features/auth/data/repositories/auth_repositoty.dart';
import 'package:frontend/features/auth/presentation/controllers/auth_provider.dart';
import 'package:get_it/get_it.dart';
import '../network/dio_client.dart';

final sl = GetIt.instance;

void init() {
  // Core
  sl.registerLazySingleton(() => DioClient());

  // Repositories
  sl.registerLazySingleton(() => AuthRepository(dioClient: sl<DioClient>()));

  // Providers
  sl.registerFactory(() => AuthProvider(repository: sl<AuthRepository>()));
}
