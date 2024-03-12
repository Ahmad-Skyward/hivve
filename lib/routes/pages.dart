import 'package:get/get.dart';
import 'package:hivve/assests/image_picker.dart';
import 'package:hivve/routes/route_names.dart';
import 'package:hivve/ui/abc.dart';
import 'package:hivve/ui/calculator.dart';
import 'package:hivve/ui/splash_screen.dart';
import 'package:hivve/ui/uii.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RouteNames.splashScreen,
          page: () => const SplashScreen(),
          transition: Transition.fade,
        ),
        GetPage(
          name: RouteNames.abc,
          page: () => const Abc(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteNames.viewImage,
          page: () => const ViewImages(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteNames.calculator,
          page: () => const Calculator(),
          transition: Transition.rightToLeftWithFade,
        ),
        GetPage(
          name: RouteNames.newScreen,
          page: () => const NewScreen(),
          transition: Transition.rightToLeftWithFade,
        ),
      ];
}
