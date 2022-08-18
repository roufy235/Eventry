import 'package:eventry/app.dart';
import 'package:eventry/firebase_options.dart';
import 'package:eventry/models/hive/user_data_hive.dart';
import 'package:eventry/resource/hive_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataHiveAdapter());
  await Hive.openBox(boxName);
  runApp(ProviderScope(child: MyApp()));
}

