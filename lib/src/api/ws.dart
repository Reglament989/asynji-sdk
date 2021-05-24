import 'dart:convert';

import 'package:asynji_sdk/src/api/sender.dart';
import 'package:asynji_sdk/src/api/types/ws_event.dart';
import 'package:asynji_sdk/src/storage/controlers/global.controller.dart';
import 'package:asynji_sdk/src/storage/controlers/room.controller.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/io.dart';

class SyncController {
  late final IOWebSocketChannel __currentChannel;
  final RoomController __roomController = RoomController();
  final GlobalController __globalController = GlobalController();

  void run() {
    // TODO: Need check if token valid, because ws errors does not implemented.
    __currentChannel = IOWebSocketChannel.connect(
        Uri.parse(__globalController.getServerUri()),
        pingInterval: Duration(seconds: 54),
        headers: {
          'X-Api-Key': __globalController.getCurrentToken(),
          'X-Topics':
              json.encode({'topics': __roomController.getAllIdsOfRooms()})
        });

    __currentChannel.stream.listen((message) {
      try {
        final event = Event.fromJson(json.decode(message));
        if (event.isBodyEncrypted) {}
        if (event.subject == EventSubject.room) {
          // __roomController.box.
        }
      } catch (e) {}
    });
  }

  Future<void> close({bool restart = true}) async {
    await __currentChannel.sink.close(status.goingAway);
    if (restart) {
      run();
    }
  }
}
