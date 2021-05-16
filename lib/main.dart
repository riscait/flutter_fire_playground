import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';

import 'src/app.dart';
import 'src/top_level_providers/flavor.dart';
import 'src/top_level_providers/package_info_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // ビルド時に指定したFlavorを取得
  const flavorString = String.fromEnvironment('FLAVOR');
  final flavor = Flavor.values.firstWhere((e) => e.key == flavorString);

  runApp(
    ProviderScope(
      overrides: [
        flavorProvider.overrideWithValue(flavor),
        appPackageInfoProvider.overrideWithValue(
          AppPackageInfo(await PackageInfo.fromPlatform()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
