import 'package:flutter/material.dart';

import '../infrastructure/utils/constants.dart';

class CustomScaffold extends StatefulWidget {
  const CustomScaffold({
    super.key,
    required this.body,
    this.showEndDrawer,
  });

  final Widget body;
  final bool? showEndDrawer;

  @override
  State<CustomScaffold> createState() => _CustomScaffoldState();
}

class _CustomScaffoldState extends State<CustomScaffold> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBarBody(context),
        body: _body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        endDrawer: widget.showEndDrawer ?? false ? _endDrawerWidget() : null,
      );

  Widget _endDrawerWidget() => Drawer(child: Placeholder());

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

  Widget _body() => Column(
        children: [
          Expanded(
            flex: 6,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: LayoutBuilder(
                builder: (context, constraints) => Center(
                  child: SizedBox(
                    // height: constraints.maxHeight * 0.90,
                    // width: constraints.maxWidth * 0.95,
                    child: widget.body,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}
