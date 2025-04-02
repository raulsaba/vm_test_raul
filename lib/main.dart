import 'package:flutter/material.dart';
import 'package:vm_test/app/core/get_it/get_it_config.dart';
import 'package:vm_test/app/core/theme/app_theme_data.dart';
import 'package:vm_test/app/features/exam/ui/exam_container.dart';

Future<void> main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'VM Test Raul', theme: AppThemeData.lightTheme, home: const ExamContainer());
  }
}
