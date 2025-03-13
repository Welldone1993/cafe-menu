import 'package:cafe_menu_temp/lib/src/infrastructure/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../infrastructure/utils/constants.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.showEndDrawer,
    this.appbar,
  });

  final Widget body;
  final bool? showEndDrawer;
  final AppBar? appbar;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: widget.appbar ?? _appBarBody(context),
        body: _body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        endDrawer: widget.showEndDrawer ?? false ? _endDrawerWidget() : null,
      );

  Widget _endDrawerWidget() => Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Get.offAllNamed(CafeMenuRouteNames.homePage.uri),
              child: Text('Home'),
            ),
            ElevatedButton(
              onPressed: () =>
                  Get.toNamed(CafeMenuRouteNames.firstStyleMenuPage.uri),
              child: Text('Style 1'),
            ),
          ],
        ),
      );

  AppBar _appBarBody(BuildContext context) => AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.blueGrey,
        automaticallyImplyLeading: false,
        leadingWidth: Constants.width(context, fraction: 2),
        title: Text('Cafe Menu'),
        centerTitle: true,
        actions: [if (widget.showEndDrawer ?? false) _endDrawerBuilder()],
      );

  Widget _endDrawerBuilder() => Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      );

  Widget _body() => LayoutBuilder(
        builder: (context, constraints) => Padding(
          padding: constraints.maxWidth >= 1000
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : EdgeInsets.zero,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) => widget.body,
            ),
          ),
        ),
      );
}
