import '../../feature/member/controllers/auth/auth_controller.dart';

class StorageIj {
  /// 스토리지 세팅
  static Future<void> LoadStorage() async {
    AuthController().loadToken();
    AuthController().loadMemberNo();
  }
}
