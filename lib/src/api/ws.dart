import 'dart:convert';

import 'package:asynji_sdk/src/api/types/ws_event.dart';
import 'package:asynji_sdk/src/storage/controlers/global.controller.dart';
import 'package:asynji_sdk/src/storage/controlers/room.controller.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/io.dart';

class SyncController {
  late final IOWebSocketChannel currentChannel;
  final RoomController roomController = RoomController();
  final GlobalController globalController = GlobalController();

  void initinalSync() {}

  void run() {
    // TODO: Need check if token valid, because ws errors does not implemented.
    currentChannel = IOWebSocketChannel.connect(
        Uri.parse(globalController.getServerUri()),
        pingInterval: Duration(seconds: 54),
        headers: {
          'X-Api-Key': globalController.getCurrentToken(),
          'X-Topics': json.encode({'topics': roomController.getAllIdsOfRooms()})
        });

    currentChannel.stream.listen((message) {
      try {
        final event = Event.fromJson(json.decode(message));
        if (event.isBodyEncrypted) {}
        if (event.subject == EventSubject.room) {
          // roomController.box.
        }
      } catch (e) {}
    });
  }

  Future<void> close({bool restart = true}) async {
    await currentChannel.sink.close(status.goingAway);
    if (restart) {
      run();
    }
  }
}
