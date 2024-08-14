import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:movie_app/core/di/di_container.dart';
import 'package:movie_localization/strings.g.dart';

import 'app/movie_app.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initDi();
  runApp(TranslationProvider(
    child: const MovieApp(),
  ));
}
