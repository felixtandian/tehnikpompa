import 'package:get/get.dart';

import '../../utils/splash.dart';
import '../modules/createservice/bindings/createservice_binding.dart';
import '../modules/createservice/views/createservice_view.dart';
import '../modules/daftarbarang/bindings/daftarbarang_binding.dart';
import '../modules/daftarbarang/views/daftarbarang_view.dart';
import '../modules/daftarservis/bindings/daftarservis_binding.dart';
import '../modules/daftarservis/views/daftarservis_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginscreen/bindings/loginscreen_binding.dart';
import '../modules/loginscreen/views/loginscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const LOGIN = Routes.LOGINSCREEN;
  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.LOGINSCREEN,
      page: () => LoginscreenView(),
      binding: LoginscreenBinding(),
    ),
    GetPage(name: _Paths.SPLASHSCREEN, page: () => Splash()),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DAFTARBARANG,
      page: () => DaftarbarangView(),
      binding: DaftarbarangBinding(),
    ),
    GetPage(
      name: _Paths.CREATESERVICE,
      page: () => CreateserviceView(),
      binding: CreateserviceBinding(),
    ),
    GetPage(
      name: _Paths.DAFTARSERVIS,
      page: () => DaftarservisView(),
      binding: DaftarservisBinding(),
    ),
  ];
}
