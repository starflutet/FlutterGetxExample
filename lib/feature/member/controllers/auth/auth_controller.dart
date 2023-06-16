import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../../Utils/wigets/MyUtils.dart';
import '../../models/member_model.dart';

class AuthController extends GetxController {
  static const String baseUrl = 'http://localhost:7139/MemberControllers';
  static const String login = '/Login';
  static const String logout = '/Logout';

  static AuthController getInstance() {
    return Get.find<AuthController>();
  }

  final storage = FlutterSecureStorage();
  final memberNo = ''.obs;
  final token = ''.obs;
  final result = MemberModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  ///스토리지 사용
  Future<void> saveToken(String value) async {
    await storage.write(key: 'token', value: value);
    token.value = value;
  }

  Future<void> loadToken() async {
    final value = await storage.read(key: 'token');
    token.value = value ?? '';
  }

  Future<void> saveMemberNo(String value) async {
    await storage.write(key: 'memberNo', value: value);
    memberNo.value = value;
  }

  Future<void> loadMemberNo() async {
    final value = await storage.read(key: 'memberNo');
    memberNo.value = value ?? '';
  }

  ///로그인 Http 통신
  Future<MemberModel> loginAction(
    String choiceAction,
    String memberId,
    String memberPw,
  ) async {
    var errTitle = "loginAction";
    var url = Uri.parse("");
    switch (choiceAction) {
      case 'login':
        url = Uri.parse("$baseUrl$login");
        break;
      default:
        url = Uri.parse("$baseUrl$login");
    }

    /// 헤더설정
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
      {'memberId': memberId, 'memberPw': memberPw},
    );

    /// Post 통신
    final response = await http.post((url), headers: headers, body: body);

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      dynamic decodedResponse = jsonDecode(responseBody);
      result.value = MemberModel.fromJson(decodedResponse);

      /// 로그인 결과에 따라 경고 위젯 띄우기
      if (result.value.resultCode == "0") {
        saveToken(result.value.data![0].token!);
        saveMemberNo(result.value.data![0].memberNo!.toString());
        MyUtils.showAlert("로그인성공!", "굿");
      } else {
        saveToken("");
        MyUtils.showAlert("로그인실패!", "아이디 비밀번호를 확인해주세요!");
      }
      return result.value;
    } else {
      throw Exception('$errTitle HTTP 통신중 문제발생!');
    }
  }

  ///로그아웃 Http통신
  Future<MemberModel> logoutAction(
    String choiceAction,
  ) async {
    var errTitle = "logoutAction";
    var url = Uri.parse("");
    switch (choiceAction) {
      case 'logout':
        url = Uri.parse("$baseUrl$logout");
        break;
      default:
        url = Uri.parse("$baseUrl$logout");
    }

    ///스토리지에 등록된 값 세팅
    RxString rxString = memberNo;
    int parsMemberNo = int.parse(rxString.value);

    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode(
      {'memberNo': parsMemberNo},
    );

    /// Post 통신
    final response = await http.post((url), headers: headers, body: body);

    if (response.statusCode == 200) {
      String responseBody = utf8.decode(response.bodyBytes);
      dynamic decodedResponse = jsonDecode(responseBody);
      result.value = MemberModel.fromJson(decodedResponse);
      return result.value;
    } else {
      throw Exception('$errTitle HTTP 통신중 문제발생!');
    }
  }
}
