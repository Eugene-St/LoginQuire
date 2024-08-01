import 'package:flutter/material.dart';
import 'package:quireloginform/injectable/injectable.dart';
import 'package:quireloginform/presentation/presentation.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const App());
}
