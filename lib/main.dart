import 'package:energise_test/app.dart';
import 'package:energise_test/get_it.dart';
import 'package:flutter/material.dart';

void main() async {
  await GetItService.initializeDependencies();
  runApp(const App());
}
