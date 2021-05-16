import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/app/product/bloc/product_bloc.dart';
import 'package:get/get.dart';

import '../../app/auth/bloc/authentication_bloc.dart';
import '../../app/auth/page/login/login_page.dart';
import '../../app/auth/page/onboarding_page.dart';
import '../../app/auth/page/sign_in_page.dart';
import '../../app/auth/page/splash_page.dart';
import '../../app/product/page/checkout_page.dart';
import '../../app/home/bloc/home_bloc.dart';
import '../../app/home/page/basket_page.dart';
import '../../app/home/page/home_page.dart';
import '../../app/product/page/product_page.dart';
import '../../app/temp/bloc/temp_bloc.dart';
import '../../app/temp/page/temp_page.dart';
import '../../app/tracking/page/tracking_page.dart';

class AppRouter {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: SplashPage.$PATH,
      page: () => BlocProvider<AuthBloc>(
        create: (context) => AuthBloc()..add(const AppStartedEvent()),
        child: const SplashPage(),
      ),
    ),
    GetPage(
      name: OnboardingPage.$PATH,
      page: () => BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: const OnboardingPage(),
      ),
    ),
    GetPage(
      name: SignInPage.$PATH,
      page: () => BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: const SignInPage(),
      ),
    ),
    GetPage(
      name: LoginPage.$PATH,
      page: () => BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(),
        child: const LoginPage(),
      ),
    ),
    // GetPage(
    //   name: HomePage.$PATH,
    //   page: () => BlocProvider<HomePageDataBloc>(
    //       create: (context) =>
    //           HomePageDataBloc()..add(const HomePageDataRequestedEvent()),
    //       child: const HomePage()),
    // ),
    GetPage(
        name: HomePage.$PATH,
        page: () => MultiBlocProvider(
              providers: [
                BlocProvider<HomePageDataBloc>(
                  create: (context) => HomePageDataBloc()
                    ..add(const HomePageDataRequestedEvent()),
                ),
                BlocProvider<ProductBloc>(
                  create: (context) => ProductBloc()..add(GetOrdersEvent()),
                )
              ],
              child: const HomePage(),
            )),
    // GetPage(
    //   name: ProductPage.$PATH,
    //   page: () => const ProductPage(),
    // ),
    GetPage(
      name: BasketPage.$PATH,
      page: () => const BasketPage(),
    ),
    GetPage(
      name: TrackingPage.$PATH,
      page: () => const TrackingPage(),
    ),
    // GetPage(
    //   name: CheckoutPage.$PATH,
    //   page: () => const CheckoutPage(),
    // ),
    GetPage(
      name: TempPage.$PATH,
      page: () => BlocProvider<TempBloc>(
          create: (context) => TempBloc()..add(const TempRequestedEvent()),
          child: const HomePage()),
    ),
  ];
}
