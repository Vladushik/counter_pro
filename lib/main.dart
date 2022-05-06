import 'package:counter_pro/features/counter/presentation/pages/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CounterPro',
        themeMode: ThemeMode.system,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        home: const CounterPage(),
      ),
      designSize: const Size(360, 690),
    );
  }
}
