import 'package:breed_plus/features/super_duper_algorithm/backend.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'common/app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final notificationSettings =
      await FirebaseMessaging.instance.requestPermission(provisional: true);

  final apnsToken = await FirebaseMessaging.instance.getToken();
  print(apnsToken);
  if (apnsToken != null) {
    print(apnsToken);
  }
  await Backend.init();
  runApp(const App());
}
