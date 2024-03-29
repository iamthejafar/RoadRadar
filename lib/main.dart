import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:roadradar/firebase_options.dart';
import 'package:roadradar/src/dependency_injection/dependency_injection.dart';

import 'src/core/app/app.dart';
import 'src/utils/shared_preferences/shared_preferences.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await UserPreferences.init();

  // Dependency injection
  setupLocator();
  runApp(
    ProviderScope(
      child: App(),
    )
  );
}




