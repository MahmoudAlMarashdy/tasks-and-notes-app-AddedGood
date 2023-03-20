import 'package:added_good/added_good/view/screens/home_page.dart';
import 'package:added_good/core/database/local_database.dart';
import 'package:added_good/core/styles/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await GetStorage.init();
  await LocalDatabase.initDataBase();
  runApp(const AddedGood());
}

class AddedGood extends StatelessWidget {
  const AddedGood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightAppTheme,
      darkTheme: AppThemes.darkAppTheme,
      themeMode: AppThemes.getTheme(),
      home: HomePage(),
    );
  }
}

