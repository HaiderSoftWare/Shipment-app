import 'package:get/get.dart';
import 'package:ship_app/view/pages/auth/forget/forget_password_screen.dart';
import 'package:ship_app/view/pages/auth/login/login_screen.dart';
import 'package:ship_app/view/pages/auth/otp/otp_login_screen.dart';
import 'package:ship_app/view/pages/auth/otp/otp_signup_screen.dart';
import 'package:ship_app/view/pages/auth/reset%20password/reset_screen.dart';
import 'package:ship_app/view/pages/auth/register/register_screen.dart';
import 'package:ship_app/view/pages/edit%20profile/edit_profile.dart';
import 'package:ship_app/view/pages/bottom%20navigation/bottom_navigation.dart';
import 'package:ship_app/view/pages/onborading/onborading_screen.dart';
import 'package:ship_app/view/pages/order/datiel_screen.dart';
import 'package:ship_app/view/pages/order/order_screen.dart';

import '../../../controller/middleware/middleware.dart';

routePage() => [
      GetPage(
        name: '/login',
        page: () => LoginScreen(),
        middlewares: [
          MyMiddleWare(),
        ],
      ),
      GetPage(name: '/forget', page: () => ForgetScreen()),
      GetPage(name: '/otp', page: () => const OTPLoginScreen()),
      GetPage(name: '/reset', page: () => ResetPasswordScreen()),
      GetPage(name: '/onborading', page: () => const OnboardingExample()),
      GetPage(name: '/signup', page: () => RegisterScreen()),
      GetPage(name: '/order', page: () => OrderScreen()),
      GetPage(name: '/navi', page: () => BottomNavigation()),
      GetPage(name: '/dateil', page: () => DetailScreen()),
      GetPage(name: '/editprofile', page: () => EditProfileScreen()),
      GetPage(name: '/otpsignup', page: () => const OTPSignUpScreen()),
    ];
