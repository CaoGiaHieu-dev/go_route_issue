// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs, unreachable_from_main

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'main.g.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
      );

  late final GoRouter _router = GoRouter(
    debugLogDiagnostics: true,
    initialLocation: ProfileRoute().location,
    routes: $appRoutes,
    redirect: (context, state) {
      if (state.path == '/') {
        return ProfileRoute().location;
      }
      return null;
    },
  );
}

const profile = '/profile';
const settingWithSplash = '/settingWithSplash';
const settingWithoutSplash = 'settingWithoutSplash';

@TypedStatefulShellRoute<DashboardRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfileRoute>(
          path: profile,
          routes: [
            TypedGoRoute<SettingWithSplashRoute>(
              path: settingWithSplash,
            ),
            TypedGoRoute<SettingWithoutSplashRoute>(
              path: settingWithoutSplash,
            ),
          ],
        ),
      ],
    ),
  ],
)
class DashboardRoute extends StatefulShellRouteData {
  const DashboardRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static Widget $navigatorContainerBuilder(
    BuildContext context,
    StatefulNavigationShell navigationShell,
    List<Widget> children,
  ) {
    return DashboardScreen(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    required this.navigationShell,
    required this.children,
  });
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final PageController controller;
  @override
  void initState() {
    controller = PageController(
      initialPage: widget.navigationShell.currentIndex,
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DashboardScreen oldWidget) {
    if (oldWidget.navigationShell.currentIndex ==
        widget.navigationShell.currentIndex) return;

    controller.jumpToPage(widget.navigationShell.currentIndex);

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        itemCount: widget.children.length,
        itemBuilder: (BuildContext context, int index) {
          return widget.children[index];
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}

class ProfileRoute extends GoRouteData {
  const ProfileRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                SettingWithSplashRoute().go(context);
              },
              child: Text('Goto $settingWithSplash'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                SettingWithoutSplashRoute().go(context);
              },
              child: Text('Goto $settingWithoutSplash'),
            ),
          ],
        ),
      ),
    );
  }
}

class SettingWithSplashRoute extends GoRouteData {
  const SettingWithSplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(GoRouterState.of(context).fullPath ?? ''),
      ),
    );
  }
}

class SettingWithoutSplashRoute extends GoRouteData {
  const SettingWithoutSplashRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(GoRouterState.of(context).fullPath ?? ''),
      ),
    );
  }
}
