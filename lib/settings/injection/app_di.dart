import 'package:get/get.dart';
import '../../feature/member/controllers/auth/auth_controller.dart';
import '../../feature/tmdb/controllers/trending/api_trending_controller.dart';
import '../routes/app_routes.dart';

class AppDependencies {
  /// 의존성 주입
  static Future<void> dependencies() async {
    /// 라우터 의존성 주입
    Get.put(AppRoutes());

    ///Tmdb컨트롤러 의존성주입
    Get.put(ApiTmdbTrendingController());

    ///User모델 의존성 주입
    Get.put(AuthController());
  }
}
