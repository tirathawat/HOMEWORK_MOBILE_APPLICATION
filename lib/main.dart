import 'package:flutter/material.dart';

import 'src/config/app.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() {
  timeago.setLocaleMessages('en short', timeago.EnShortMessages());
  runApp(App());
}
