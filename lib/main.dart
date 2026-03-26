import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qent/features/botton_nav_bar/presentation/manager/cubit/bottom_nav_cubit.dart';
import 'package:qent/features/botton_nav_bar/presentation/views/main_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            // elevation: 0,
          ),
        ),
        home: MainView(),
      ),
    );
  }
}
