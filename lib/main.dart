import 'package:book_management/src/presentation/bloc/books_screen_bloc/bloc/books_screen_bloc.dart';
import 'package:book_management/src/presentation/bloc/login_screen_bloc/bloc/login_screen_bloc.dart';
import 'package:book_management/src/presentation/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginScreenBloc(),),
        BlocProvider(create: (context) => BooksScreenBloc(),)
      ],
      child: MaterialApp(
        title: 'Book Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: SplashScreen(screenSize: screenSize),
      ),
    );
  }
}