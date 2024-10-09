// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: always_specify_types, public_member_api_docs

part of 'main.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $dashboardRoute,
    ];

RouteBase get $dashboardRoute => StatefulShellRouteData.$route(
      navigatorContainerBuilder: DashboardRoute.$navigatorContainerBuilder,
      factory: $DashboardRouteExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/profile',
              factory: $ProfileRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/settingWithSplash',
                  factory: $SettingWithSplashRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: 'settingWithoutSplash',
                  factory: $SettingWithoutSplashRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
      ],
    );

extension $DashboardRouteExtension on DashboardRoute {
  static DashboardRoute _fromState(GoRouterState state) =>
      const DashboardRoute();
}

extension $ProfileRouteExtension on ProfileRoute {
  static ProfileRoute _fromState(GoRouterState state) => const ProfileRoute();

  String get location => GoRouteData.$location(
        '/profile',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingWithSplashRouteExtension on SettingWithSplashRoute {
  static SettingWithSplashRoute _fromState(GoRouterState state) =>
      const SettingWithSplashRoute();

  String get location => GoRouteData.$location(
        '/settingWithSplash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SettingWithoutSplashRouteExtension on SettingWithoutSplashRoute {
  static SettingWithoutSplashRoute _fromState(GoRouterState state) =>
      const SettingWithoutSplashRoute();

  String get location => GoRouteData.$location(
        '/profile/settingWithoutSplash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
