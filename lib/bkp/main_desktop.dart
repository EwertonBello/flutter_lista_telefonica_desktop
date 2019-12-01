import 'package:flutter/foundation.dart'
    show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';

import './first.dart';

void main() {
  debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  // runApp(HomePage());
  runApp(First());
}
