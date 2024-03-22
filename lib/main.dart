import 'dart:async';

import 'package:ecommerce/app.dart';
import 'package:ecommerce/data/repositories/authentication/authenticatoin_repostory.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  //* widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //* Getx Local Storage
  await GetStorage.init();

  //* await splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //* Initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
