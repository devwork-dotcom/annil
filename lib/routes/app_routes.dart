

import 'package:annill/features/authentication/presentation/screens/onboarding_screen.dart';
import 'package:annill/features/cart/presentation/screen/checkout_screen.dart';
import 'package:annill/features/home/presentaion/screens/home_helper_screen/all_products_screen.dart';
import 'package:annill/features/home/presentaion/screens/home_helper_screen/farm_profile_screen.dart';
import 'package:annill/features/home/presentaion/screens/home_helper_screen/product_details_screen.dart';
import 'package:annill/features/orders/presentation/screen/customer_review_screen.dart';
import 'package:annill/features/orders/presentation/screen/invoice_screen.dart';
import 'package:annill/features/orders/presentation/screen/order_tracking_screen.dart';
import 'package:annill/features/profile/presentation/screens/company_information_screen.dart';
import 'package:annill/features/profile/presentation/screens/legal_policies_screen.dart';
import 'package:annill/features/profile/presentation/screens/user_information_screen.dart';
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
  static String farmProfileScreen = "/farmProfileScreen";

  //Cart
  static String checkoutScreen = "/checkoutScreen";

  //Order
  static String orderTrackingScreen = "/orderTrackingScreen";
  static String invoiceScreen = "/invoiceScreen";
  static String customerReviewScreen = "/customerReviewScreen";

  //Profile
  static String userInfoScreen = "/updateUserInfo";
  static String companyInfoScreen = "/updateCompanyInfo";
  static String changePasswordScreen = "/changePasswordScreen";
  static String legalAndPoliciesScreen = "/legalAndPoliciesScreen";

  static String emailVerifyScreen = "/emailVerifyScreen";
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
    GetPage(name: farmProfileScreen, page:() => FarmProfileScreen()),

    //cart
    GetPage(name: checkoutScreen, page:() => CheckoutScreen()),

    //order
    GetPage(name: orderTrackingScreen, page:() => OrderTrackingScreen()),
    GetPage(name: invoiceScreen, page:() => InvoiceScreen()),
    GetPage(name: customerReviewScreen, page:() => CustomerReviewScreen()),
    //Profile
    GetPage(name: userInfoScreen, page:() => UserInformationScreen()),
    GetPage(name: companyInfoScreen, page:() => CompanyInformationScreen()),
    GetPage(name: changePasswordScreen, page:() =>  ChangePasswordScreen()),
    GetPage(name: legalAndPoliciesScreen, page:() =>  LegalPoliciesScreen()),

    // Added by Shahriar
    GetPage(name: init, page: () =>  SplashScreen()),
    GetPage(name: initialScreen, page: () =>  OnboardingInitScreen()),
    GetPage(name: initialScreen, page: () =>  OnboardingInitScreen()),
    GetPage(name: roleSelectionScreen, page: () =>  RoleSelectionScreen()),

    GetPage(name: loginScreen, page: () =>  LoginScreen()),
    GetPage(name: signUpScreen, page:() =>  SignUpScreen()),
    GetPage(name: emailVerifyScreen, page:() =>  EmailVerifyScreen()),
    GetPage(name: personalInformationScreen, page:() =>  PersonalInformationScreen()),
    GetPage(name: resetPasswordScreen, page:() =>  ResetPasswordScreen()),
    GetPage(name: verifyCodeScreen, page:() =>  VerifyCodeScreen()),
    GetPage(name: navBar, page:() =>  NavBar()),




  ];
}