import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:habitz/constants/color.dart';
import 'package:habitz/constants/routes.dart';
import 'package:habitz/database/habit_database.dart';
import 'package:habitz/screens/home/home_screen.dart';
import 'package:habitz/screens/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HabitDatabase.initialize();
  await HabitDatabase().saveFirstLaunchDate();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HabitDatabase(),
        ),
      ],
      child: const Habitz(),
    ),
  );
}

class Habitz extends StatelessWidget {
  const Habitz({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 812),
      builder: (ctx, c) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: AppColors.primary,
        ),
        getPages: [
          GetPage(
            name: Routes.splash,
            page: () => const SplashScreen(),
          ),
          GetPage(
            name: Routes.home,
            page: () => const HomeScreen(),
          ),
        ],
      ),
    );
  }
}
