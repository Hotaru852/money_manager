import 'package:flutter/material.dart';

import '../components/navigation_drawer.dart';

class PeoplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    drawer: NavigationDrawerWidget(),
    appBar: AppBar(
      title: Text('People'),
      centerTitle: true,
    ),
  );
}