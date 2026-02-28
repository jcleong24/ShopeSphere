import 'package:flutter_user_ecomm_app/core/routers/route_name.dart';
import 'package:go_router/go_router.dart';
import '../../screens/splash_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
    ],
  );
}
