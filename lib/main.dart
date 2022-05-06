import 'package:counter_pro/features/counter_simple/presentation/pages/simple_counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_themes.dart';
import 'features/counter/presentation/pages/counter_page.dart';

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
        home: const HomePage(),
      ),
      designSize: const Size(360, 690),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: const [
          SimpleCounterPage(),
          CounterPage(),
          Center(child: Text('In progress')),
          Center(child: Text('In progress')),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.plus_one), label: 'Simple'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Pro'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Multi'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
