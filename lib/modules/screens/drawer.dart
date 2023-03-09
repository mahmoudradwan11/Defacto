import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'home.dart';
import 'menu.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return const ZoomDrawer(
      menuScreen: MenuPage(),
      mainScreen: Home(),
      mainScreenScale: 0.203,
      angle: 0,
      duration: Duration(milliseconds: 600),
    );
  }
}
