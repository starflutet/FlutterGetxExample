import 'package:get/get.dart';
import '../../Utils/screens/error_page.dart';
import '../../feature/home/screens/home_screen.dart';
import '../../feature/tmdb/screens/tmdb_main_screen.dart';
import 'route_paths.dart';

class AppPages {
  AppPages._();

  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomeScreen(),
    ),
    /**
     * TMDB 메인페이지
     * */
    GetPage(
      name: Routes.tmdbMainPage,
      page: () => TmdbMainScreen(),
    ),
  ];

  static final unknownPage = GetPage(
    name: Routes.errorPage,
    page: () => const ErrorPage(),
  );
}
