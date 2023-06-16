import 'package:flutter/material.dart';
import '../../settings/routes/app_routes.dart';
import '../../settings/routes/route_paths.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Error Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("페이지를 찾을수 없습니다."),
            ElevatedButton(
              onPressed: () {
                AppRoutes.getInstance().getOffAllName(routes: Routes.homePage);
              },
              child: const Text("뒤로가기"),
            ),
          ],
        ),
      ),
    );
  }
}
