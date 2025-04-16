// Create the global locator instance
import 'package:get_it/get_it.dart';
import 'package:pixel_field_app/core/app_config.dart';
import 'package:pixel_field_app/core/network_layer/mock_api_service.dart';
import 'package:pixel_field_app/core/services/connectivity_service.dart';
import 'package:pixel_field_app/core/services/hive_services/hive_service.dart';
import 'package:pixel_field_app/features/collections/domain_layer/usecase/load_collections.usecase.dart';
import 'package:pixel_field_app/features/collections/domain_layer/usecase/load_single_collection.usecase.dart';
import 'package:pixel_field_app/features/onboarding/data_layer/onboarding.repo.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/onboarding.interface.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/signin.usecase.dart';

final GetIt getIt = GetIt.I;
Future<void> serviceLocatorInitializer(AppConfig config) async {
  getIt.registerFactory<MockApiServie>(() => MockApiServie());

  getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());
  getIt.registerFactory<HiveLocalStorageServices>(
    () => HiveLocalStorageServices(),
  );

  getIt.registerFactory<SigninUserUsecase>(() => SigninUserUsecase());
  getIt.registerFactory<LoadCollectionsUsecase>(() => LoadCollectionsUsecase());
  getIt.registerFactory<LoadSingleCollectionUsecase>(
    () => LoadSingleCollectionUsecase(),
  );
  getIt.registerFactory<OnboardingInterface>(() => OnboardingUserRepository());
  // getIt.registerFactory<>(() => );
}
