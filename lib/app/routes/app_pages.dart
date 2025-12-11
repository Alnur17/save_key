import 'package:get/get.dart';

import '../modules/auth/chose_role/bindings/chose_role_binding.dart';
import '../modules/auth/chose_role/views/chose_role_view.dart';
import '../modules/auth/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/auth/forgot_password/views/forgot_password_view.dart';
import '../modules/auth/login/bindings/login_binding.dart';
import '../modules/auth/login/views/login_view.dart';
import '../modules/auth/onboarding/bindings/onboarding_binding.dart';
import '../modules/auth/onboarding/views/onboarding_view.dart';
import '../modules/auth/signup/bindings/signup_binding.dart';
import '../modules/auth/signup/views/signup_view.dart';
import '../modules/auth/splash/bindings/splash_binding.dart';
import '../modules/auth/splash/views/splash_view.dart';
import '../modules/local_business/deals/bindings/deals_binding.dart';
import '../modules/local_business/deals/views/deals_view.dart';
import '../modules/local_business/insights/bindings/insights_binding.dart';
import '../modules/local_business/insights/views/insights_view.dart';
import '../modules/local_business/local_business_account/bindings/local_business_account_binding.dart';
import '../modules/local_business/local_business_account/views/local_business_account_view.dart';
import '../modules/local_business/local_business_dashboard/bindings/local_business_dashboard_binding.dart';
import '../modules/local_business/local_business_dashboard/views/local_business_dashboard_view.dart';
import '../modules/local_business/local_business_home/bindings/local_business_home_binding.dart';
import '../modules/local_business/local_business_home/views/local_business_home_view.dart';
import '../modules/local_business/scan/bindings/scan_binding.dart';
import '../modules/local_business/scan/views/scan_view.dart';
import '../modules/local_business/setup_your_business/bindings/setup_your_business_binding.dart';
import '../modules/local_business/setup_your_business/views/setup_your_business_view.dart';
import '../modules/member/account/bindings/account_binding.dart';
import '../modules/member/account/views/account_view.dart';
import '../modules/member/dashboard/bindings/dashboard_binding.dart';
import '../modules/member/dashboard/views/dashboard_view.dart';
import '../modules/member/favorite/bindings/favorite_binding.dart';
import '../modules/member/favorite/views/favorite_view.dart';
import '../modules/member/home/bindings/home_binding.dart';
import '../modules/member/home/views/home_view.dart';
import '../modules/member/savings/bindings/savings_binding.dart';
import '../modules/member/savings/views/savings_view.dart';
import '../modules/member/subscription_plan/bindings/subscription_plan_binding.dart';
import '../modules/member/subscription_plan/views/subscription_plan_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOCAL_BUSINESS_DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.CHOSE_ROLE,
      page: () => ChoseRoleView(),
      binding: ChoseRoleBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION_PLAN,
      page: () => const SubscriptionPlanView(),
      binding: SubscriptionPlanBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT,
      page: () => AccountView(),
      binding: AccountBinding(),
    ),
    GetPage(
      name: _Paths.SAVINGS,
      page: () => const AnalyticsView(),
      binding: SavingsBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETUP_YOUR_BUSINESS,
      page: () => SetupYourBusinessView(),
      binding: SetupYourBusinessBinding(),
    ),
    GetPage(
      name: _Paths.LOCAL_BUSINESS_DASHBOARD,
      page: () => const LocalBusinessDashboardView(),
      binding: LocalBusinessDashboardBinding(),
    ),
    GetPage(
      name: _Paths.LOCAL_BUSINESS_HOME,
      page: () => const LocalBusinessHomeView(),
      binding: LocalBusinessHomeBinding(),
    ),
    GetPage(
      name: _Paths.INSIGHTS,
      page: () => const InsightsView(),
      binding: InsightsBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () => const ScanView(),
      binding: ScanBinding(),
    ),
    GetPage(
      name: _Paths.DEALS,
      page: () => const DealsView(),
      binding: DealsBinding(),
    ),
    GetPage(
      name: _Paths.LOCAL_BUSINESS_ACCOUNT,
      page: () => const LocalBusinessAccountView(),
      binding: LocalBusinessAccountBinding(),
    ),
  ];
}
