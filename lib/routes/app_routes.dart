

import 'package:annill/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:annill/features/home/presentaion/screens/home_helper_screen/all_products_screen.dart';
import 'package:annill/features/home/presentaion/screens/home_helper_screen/product_details_screen.dart';
import 'package:annill/features/role_selection/screen/role_selection_screen.dart';
import 'package:get/get.dart';
import '../features/authentication/presentation/screens/email_verify_screen.dart';
import '../features/authentication/presentation/screens/login_screen.dart';
import '../features/authentication/presentation/screens/reset_password_screen.dart';
import '../features/authentication/presentation/screens/sing_up_screen.dart';

import '../features/authentication/presentation/screens/verify_code_screen.dart';
import '../features/home/presentaion/screens/home_screen.dart';
import '../features/nav_bar/presentation/screens/nav_bar.dart';
import '../features/profile/presentation/screens/change_password_screen.dart';
import '../features/profile/presentation/screens/personal_information_screen.dart';
import '../features/splash_screen/presentation/screens/splash_screen.dart';

class AppRoute {

  // Auth Section
  static String init = "/";

  static String onboardScreen = "/onboardScreen";
  static String initialScreen = "/initialScreen";
  static String roleSelectionScreen = "/roleSelection";

  static String loginScreen = "/loginScreen";
  static String signUpScreen = "/signUpScreen";

  static String homeScreen = "/homeScreen";
  static String allProductScreen = "/allProductsScreen";
  static String productDetailsScreen = "/productDetailsScreen";


  static String emailVerifyScreen = "/emailVerifyScreen";
  static String changePasswordScreen = "/resetPasswordScreen";
  static String personalInformationScreen = "/verifyCodeScreen";
  static String resetPasswordScreen = "/resetPasswordScreen";
  static String verifyCodeScreen = "/verifyCodeScreen";




  static String navBar = "/navBar";




  static List<GetPage> routes = [

    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signUpScreen, page:() =>  SignUpScreen()),

    GetPage(name: homeScreen, page:() => const HomeScreen()),
    GetPage(name: allProductScreen, page:() => AllProductsScreen(selectedCategory: Get.arguments ?? '',)),
    GetPage(name: productDetailsScreen, page:() => ProductDetailsScreen()),


    // Added by Shahriar
    GetPage(name: init, page: () =>  SplashScreen()),
    GetPage(name: initialScreen, page: () =>  OnboardingInitScreen()),
    GetPage(name: initialScreen, page: () =>  OnboardingInitScreen()),
    GetPage(name: roleSelectionScreen, page: () =>  RoleSelectionScreen()),

    GetPage(name: loginScreen, page: () =>  LoginScreen()),
    GetPage(name: signUpScreen, page:() =>  SignUpScreen()),
    GetPage(name: emailVerifyScreen, page:() =>  EmailVerifyScreen()),
    GetPage(name: changePasswordScreen, page:() =>  ChangePasswordScreen()),
    GetPage(name: personalInformationScreen, page:() =>  PersonalInformationScreen()),
    GetPage(name: resetPasswordScreen, page:() =>  ResetPasswordScreen()),
    GetPage(name: verifyCodeScreen, page:() =>  VerifyCodeScreen()),
    GetPage(name: navBar, page:() =>  NavBar()),




  ];
}