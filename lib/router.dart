import 'package:book_management/src/presentation/ui/books_screen/books_screen.dart';
import 'package:book_management/src/presentation/ui/login_screen/login_screen.dart';
import 'package:book_management/src/presentation/ui/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum AppRoute{
  splash,
  login,
  books,
}

GoRouter goRouter({required Size screenSize}){
  return GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase> [
      GoRoute(
        path: '/splash',
        name: AppRoute.splash.name,
        builder: (context, state) {
          return SplashScreen(screenSize: screenSize);
        },
      ),
      GoRoute(
        path: '/login',
        name: AppRoute.login.name,
        builder: (context, state) {
          return LoginScreen(screenSize: screenSize);
        },
      ),
      GoRoute(
        path: '/books',
        name: AppRoute.books.name,
        builder: (context, state) {
          return BooksScreen(screenSize: screenSize,);
        },
      ),
    ]
  );
}