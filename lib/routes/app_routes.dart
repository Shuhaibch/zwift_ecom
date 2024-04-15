import 'package:ecommerce/features/authentication/screens/login/login.dart';
import 'package:ecommerce/features/authentication/screens/on_boarding/onboarding.dart';
import 'package:ecommerce/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce/features/authentication/screens/signup/verifty_email_screen.dart';
import 'package:ecommerce/features/personalization/screens/address/address.dart';
import 'package:ecommerce/features/personalization/screens/profile/profile_screen.dart';
import 'package:ecommerce/features/personalization/screens/settings/setting_screen.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/cart/cart_screen.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/features/shop/screens/home/home_screen.dart';
import 'package:ecommerce/features/shop/screens/order/order_screen.dart';
import 'package:ecommerce/features/shop/screens/product_details/porduct_details.dart';
import 'package:ecommerce/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:ecommerce/features/shop/screens/store/store.dart';
import 'package:ecommerce/features/shop/screens/whishlist/wishlist_screen.dart';
import 'package:ecommerce/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
GetPage(name: CRoutes.home, page: () => const HomeScreen()),
GetPage(name: CRoutes.store, page: () => const StoreScreen()),
GetPage(name: CRoutes.favorites, page: () => const WishlistScreen()),
GetPage(name: CRoutes.settings, page: () => const SettingScreen()),
GetPage(name: CRoutes.productReviews, page: () => const ProductReviewScreen()),
GetPage(name: CRoutes.productDetail, page: () =>  ProductDetailsScreen(product: ProductModel.empty(),)),
GetPage(name: CRoutes.order, page: () => const OrderScreen()),
GetPage(name: CRoutes.checkout, page: () => const CheckoutScreen()),
GetPage(name: CRoutes.cart, page: () => const CartScreen()),
GetPage(name: CRoutes.userProfile, page: () => const ProfileScreen()),
GetPage(name: CRoutes.userAddress, page: () => const UserAddressScreen()),
GetPage(name: CRoutes.signup, page: () => const SignupScreen()),
GetPage(name: CRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
GetPage(name: CRoutes.signIn, page: () => const LoginScreen()),
GetPage(name: CRoutes.forgetPassword, page: () => const ForgetPasswordScreen()),
GetPage(name: CRoutes.onBording, page: () => const OnBoardingScreen()),

  ];
}
