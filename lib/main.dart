import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nanny_fairy/FamilyController/family_auth_controller.dart';
import 'package:nanny_fairy/FamilyController/family_home_controller.dart';
import 'package:nanny_fairy/Repository/auth_repository.dart';
import 'package:nanny_fairy/Repository/family_auth_repository.dart';
import 'package:nanny_fairy/Repository/family_home_repo.dart';
import 'package:nanny_fairy/Repository/home_ui_repostory.dart';
import 'package:nanny_fairy/Repository/provider_home_repository.dart';
import 'package:nanny_fairy/Repository/search_repository.dart';
import 'package:nanny_fairy/ViewModel/auth_view_model.dart';
import 'package:nanny_fairy/ViewModel/provider_home_view_model.dart';
import 'package:nanny_fairy/ViewModel/search_view_model.dart'; // Import the SearchViewModel
import 'package:nanny_fairy/res/components/colors.dart';
import 'package:nanny_fairy/utils/routes/routes.dart';
import 'package:nanny_fairy/utils/routes/routes_name.dart';
import 'package:nanny_fairy/view/onboarding/splash_view.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthRepository>(
          create: (_) => AuthRepository(),
        ),
        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(context.read<AuthRepository>()),
        ),
        Provider<AuthRepositoryFamily>(
          create: (_) => AuthRepositoryFamily(),
        ),
        ChangeNotifierProvider<FamilyAuthController>(
          create: (context) =>
              FamilyAuthController(context.read<AuthRepositoryFamily>()),
        ),
        Provider<ProviderHomeRepository>(
          create: (_) => ProviderHomeRepository(),
        ),
        ChangeNotifierProvider<ProviderHomeViewModel>(
          create: (context) =>
              ProviderHomeViewModel(context.read<ProviderHomeRepository>()),
        ),
        Provider<FamilyHomeRepository>(
          create: (_) => FamilyHomeRepository(),
        ),
        ChangeNotifierProvider<FamilyHomeController>(
          create: (context) =>
              FamilyHomeController(context.read<FamilyHomeRepository>()),
        ),
        ChangeNotifierProvider<HomeUiSwithchRepository>(
          create: (_) => HomeUiSwithchRepository(),
        ),
        ChangeNotifierProvider<SearchRepository>(
          // Use ChangeNotifierProvider here
          create: (_) => SearchRepository(),
        ),
        ChangeNotifierProvider<SearchViewModel>(
          create: (context) =>
              SearchViewModel(context.read<SearchRepository>()),
        ),
      ],
      child: MaterialApp(
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.whiteColor,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primaryColor),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
