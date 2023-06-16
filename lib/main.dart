import 'package:flutter/material.dart';
import 'package:flutter_getx_example/settings/injection/app_di.dart';
import 'package:flutter_getx_example/settings/injection/storage_ij.dart';
import 'package:flutter_getx_example/settings/routes/app_pages.dart';
import 'package:flutter_getx_example/settings/routes/route_paths.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// 의존성 주입
  await AppDependencies.dependencies();
  await StorageIj.LoadStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: Colors.indigo,
          outline: Colors.indigo,
        ),
      ),
      initialRoute: Routes.homePage,
      getPages: AppPages.pages,
      unknownRoute: AppPages.unknownPage,
    );
  }
}
