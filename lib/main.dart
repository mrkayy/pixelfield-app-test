import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:pixel_field_app/core/app_config.dart';
import 'package:pixel_field_app/core/service_locator.dart';
import 'package:pixel_field_app/core/services/hive_services/hive_models/fake_collection.model.dart';
import 'package:pixel_field_app/core/services/hive_services/hive_models/fake_user.model.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/launch_bloc/bloc.dart';
import 'package:pixel_field_app/features/onboarding/presentation_layer/blocs/signin_bloc/bloc.dart';
import 'package:pixel_field_app/routes.dart';
import 'package:pixel_field_app/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const String dir = String.fromEnvironment("ENV");
  const String apiKey = String.fromEnvironment("API_KEY");
  const String baseUrl = String.fromEnvironment("BASE_URL");

  final AppConfig config = AppConfig(
    cacheDir: dir,
    apiKey: apiKey,
    baseUrl: baseUrl,
  );

  // Creating a sub-directory to cater for development, staging & production environment
  // This enables effective data cachinig for tesing and development
  await Hive.initFlutter(config.cacheDir);
  //

  Hive.registerAdapter<FakeUser>(FakeUserAdapter());
  Hive.registerAdapter<FakeCollection>(FakeCollectionAdapter());
  Hive.registerAdapter<FakeBottleDetails>(FakeBottleDetailsAdapter());
  Hive.registerAdapter<FakeHistory>(FakeHistoryAdapter());
  Hive.registerAdapter<FakeLabel>(FakeLabelAdapter());
  Hive.registerAdapter<FakeSpecifications>(FakeSpecificationsAdapter());
  Hive.registerAdapter<FakeTastingNotes>(FakeTastingNotesAdapter());
  Hive.registerAdapter<FakeProfessional>(FakeProfessionalAdapter());

  await serviceLocatorInitializer(config);
  await Hive.openBox("users");
  await Hive.openBox("collection");

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LaunchBloc()),
        BlocProvider(create: (context) => SigninBloc()),
      ],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final window = View.of(context);
    final physicalScreenSize = window.physicalSize;
    final pixelRatio = window.devicePixelRatio;

    // Calculate dp (logical size)
    final screenWidthDp = physicalScreenSize.width / pixelRatio;
    final screenHeightDp = physicalScreenSize.height / pixelRatio;

    return ScreenUtilInit(
      designSize: Size(screenWidthDp, screenHeightDp),
      splitScreenMode: false,
      minTextAdapt: true,
      builder:
          (_, __) => MediaQuery.withClampedTextScaling(
            minScaleFactor: 0.7,
            maxScaleFactor: 1.2,
            child: MaterialApp.router(
              routerConfig: AppRoutes().routesConfig,
              theme: CustomThemeData().themeData,
              debugShowCheckedModeBanner: kDebugMode,
              // home: Scaffold(body: Center(child: Text('Hello World!'))),
            ),
          ),
    );
  }
}
