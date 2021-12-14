import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedb/application/bindings/application_bindings.dart';
import 'package:moviedb/application/ui/moviedb_ui_config.dart';
import 'package:moviedb/modules/detail/detail_module.dart';
import 'package:moviedb/modules/home/home_module.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  RemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: MoviedbUiConfig.title,
      initialBinding: ApplicationBindings(),
      theme: MoviedbUiConfig.theme,
      getPages: [
        ...HomeModule().routers,
        ...DetailModule().routers,
      ],
    );
  }
}
