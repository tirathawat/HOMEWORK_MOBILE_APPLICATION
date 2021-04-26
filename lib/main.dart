import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/config/app.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  timeago.setLocaleMessages('en short', timeago.EnShortMessages());
  runApp(App());
}
