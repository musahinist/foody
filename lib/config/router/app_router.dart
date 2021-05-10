import 'package:get/get.dart';

import '../../app/auth/page/onboarding_page.dart';
import '../../app/auth/page/sign_in_page.dart';
import '../../app/checkout/page/checkout_page.dart';
import '../../app/home/page/cart_page.dart';
import '../../app/home/page/home_page.dart';
import '../../app/product/page/product_page.dart';

class AppRouter {
  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: OnboardingPage.$PATH,
      page: () => const OnboardingPage(),
    ),
    GetPage(
      name: SignInPage.$PATH,
      page: () => const SignInPage(),
    ),
    GetPage(
      name: HomePage.$PATH,
      page: () => const HomePage(),
    ),
    GetPage(
      name: ProductPage.$PATH,
      page: () => const ProductPage(),
    ),
    GetPage(
      name: CartPage.$PATH,
      page: () => const CartPage(),
    ),
    GetPage(
      name: CheckoutPage.$PATH,
      page: () => const CheckoutPage(),
    ),
    // GetPage(
    //   name: DeviceInfoPage.$PATH,
    //   page: () => BlocProvider<DeviceInfoBloc>(
    //       create: (context) =>
    //           DeviceInfoBloc()..add(const DeviceInfoRequestEvent()),
    //       child: const DeviceInfoPage()),
    // ),
    // GetPage(
    //   name: FlowingTextPage.$PATH,
    //   page: () => const FlowingTextPage(),
    // ),
    // GetPage(
    //   name: RedditPage.$PATH,
    //   page: () => BlocProvider<RedditBloc>(
    //       create: (context) => RedditBloc()..add(const RedditRequestEvent()),
    //       child: const RedditPage()),
    // ),
  ];
}
