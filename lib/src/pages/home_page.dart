import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'auth_page.dart';
import 'version_check_page.dart';

class HomePage extends HookWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _navigateToPage(Widget page) {
      Navigator.of(context).push<void>(MaterialPageRoute(builder: (_) => page));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('FlutterFire Playground'),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 64,
            delegate: SliverChildListDelegate.fixed(
              [
                ListTile(
                  title: const Text('Version Check Page'),
                  onTap: () => _navigateToPage(const VersionCheckPage()),
                ),
                ListTile(
                  title: const Text('Authentication Page'),
                  onTap: () => _navigateToPage(const AuthPage()),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
