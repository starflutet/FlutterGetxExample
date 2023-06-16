import 'package:flutter/material.dart';
import '../../../settings/routes/app_routes.dart';
import '../../../settings/routes/route_paths.dart';
import '../../member/controllers/auth/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var memberId = '';
    var memberPw = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text("홈 화면"),
        elevation: 5.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () async {
                AppRoutes.getInstance().getToName(routes: Routes.tmdbMainPage);
              },
              child: const Text("TMDB 연습페이지 이동"),
            ),
            Column(
              children: [
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: '아이디',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2)),
                    ),
                    onChanged: (value) {
                      memberId = value;
                    },
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextFormField(
                    onChanged: (value) {
                      memberPw = value;
                    },
                    obscureText: true, // 입력한 텍스트를 가려서 표시합니다
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle:
                          TextStyle(color: Color.fromRGBO(0, 0, 0, 0.2)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AuthController.getInstance().loginAction(
                      "login",
                      memberId,
                      memberPw,
                    );
                  },
                  child: const Text("로그인하기"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    AuthController.getInstance().logoutAction(
                      "logout",
                    );
                  },
                  child: const Text(
                    "로그아웃하기",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
