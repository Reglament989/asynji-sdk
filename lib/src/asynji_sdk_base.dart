import 'dart:io';

import 'package:asynji_sdk/src/base/base_model.dart';
import 'package:asynji_sdk/src/base/controllers/sync_controller.dart';
import 'package:asynji_sdk/src/db/db.dart';

class Asynji extends SyncController {
  @override
  Future<void> init() async {
    await Database.init();
    await super.init();
  }
}
