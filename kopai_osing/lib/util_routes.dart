import 'package:get/get.dart';
import 'package:kopai_osing/home_page.dart';
import 'package:kopai_osing/intro_page.dart';
import 'package:kopai_osing/login_page.dart';
import 'package:kopai_osing/product_page.dart';
import 'package:kopai_osing/register_page.dart';
import 'package:kopai_osing/root_page.dart';
import 'package:kopai_osing/scan_result_page.dart';
import 'package:kopai_osing/testimoni_page.dart';

import 'qr_scan_page.dart';

class UtilRoutes {
  late String key;
  // root
  UtilRoutes.root() : key = "/";
  // wellcome
  UtilRoutes.wellcome() : key = "/wellcome";
  // intro
  UtilRoutes.intro() : key = "/intro";
  // login
  UtilRoutes.login() : key = "/login";
  // register
  UtilRoutes.register() : key = "/register";
  // home page
  UtilRoutes.home() : key = "/home";
  // qr scan page
  UtilRoutes.qrScan() : key = "/qrScan";
  // testimoni
  UtilRoutes.testimoni() : key = "/testimoni";
  // scan result
  UtilRoutes.scanResult() : key = "/scanResult";
  // product page
  UtilRoutes.product() : key = "/product";

  go() => Get.toNamed(key);
  goOff() => Get.offNamed(key);
  goOffAll() => Get.offAllNamed(key);

  static final pages = <GetPage>[
    // root
    GetPage(name: UtilRoutes.root().key, page: () => RootPage()),
    // wellcome
    GetPage(name: UtilRoutes.intro().key, page: () => IntroPage()),
    // login
    GetPage(name: UtilRoutes.login().key, page: () => LoginPage()),
    // register
    GetPage(name: UtilRoutes.register().key, page: () => RegisterPage()),
    // home page
    GetPage(name: UtilRoutes.home().key, page: () => HomePage()),
    // qr scan page
    GetPage(name: UtilRoutes.qrScan().key, page: () => QrScanPage()),
    //testimoni
    GetPage(name: UtilRoutes.testimoni().key, page: () => TestimoniPage()),
    // scan result
    GetPage(name: UtilRoutes.scanResult().key, page: () => ScanResultPage()),
    // product page
    GetPage(name: UtilRoutes.product().key, page: () => ProductPage()),

  ];
}
