import 'package:asynji_sdk/src/api/auth.dart';
import 'package:asynji_sdk/src/api/sender.dart';
import 'package:asynji_sdk/src/api/types/sync_body.dart';
import 'package:asynji_sdk/src/api/ws.dart';

class ApiBase {
  // late AuthController __authController;
  late SendController __sendController;
  late SyncController __syncController;

  ApiBase() {
    // __authController = AuthController();
    __sendController = SendController();
    __syncController = SyncController();
  }

  Future<void> run() async {
    // TODO: need parse body into hivedb
    final syncBody = await __sendController.sendInitinalSync();
    // Sync controller own parse and manipulate with hivedb.
    __syncController.run();
  }

  Future<bool> newMessage(String roomId, String body) async {
    return await __sendController.sendMessage(roomId: roomId, body: body);
  }
}
