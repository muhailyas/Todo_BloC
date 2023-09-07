import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_bloc/bloc/todo_bloc/todo_bloc_bloc.dart';
import 'package:todo_bloc/view/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => TodoBlocBloc(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Todo Bloc',
            theme: ThemeData(
              textTheme: TextTheme(
                  bodyMedium: TextStyle(fontSize: 10.sp),
                  bodySmall: TextStyle(fontSize: 1.sp)),
            ),
            home: const ScreenHome(),
          );
        });
  }
}
