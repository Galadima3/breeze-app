import 'package:breeze/src/features/search/presentation/screens/search_home_screen.dart';
import 'package:breeze/src/features/search/presentation/screens/search_screen.dart';
import 'package:breeze/src/features/weather/presentation/screens/home_screen.dart';
import 'package:breeze/src/routing/route_paths.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: RoutePaths.homeScreenRoute,
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
        name: RoutePaths.searchScreenRoute,
        path: '/${RoutePaths.searchScreenRoute}',
        builder: (context, state) => SearchScreen(),
        routes: [
          GoRoute(
            name: RoutePaths.searchHomeScreenRoute,
            path: RoutePaths.searchHomeScreenRoute,
            builder: (context, state) {
              final String searchString = GoRouterState.of(context).extra! as String;
              // final search = state.pathParameters['searchKey'];
              return SearchHomeScreen(
                searchTerm: searchString
              );
            },
          )
        ])
  ],
);
