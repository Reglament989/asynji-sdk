import "package:asynji_sdk/src/base/base_model.dart";
import "package:asynji_sdk/src/base/controllers/auth_controller.dart";
import "package:asynji_sdk/src/base/controllers/room_controller.dart";
import "package:web_socket_channel/web_socket_channel.dart";
import "package:web_socket_channel/status.dart" as status;

class SyncController extends RoomController {
  WebSocketChannel? wsChannel;
  @override
  Future<void> init() async {
    await super.init();
    this.run();
  }

  // You dont must call this function imedentialy, it auto run with init
  void run() {
    wsChannel = WebSocketChannel.connect(Uri.parse(
        "ws://" + this.baseUrl.split("//").last.split(":").first + ":51830"));
    wsChannel!.stream.listen((event) {});
  }

  Future<void> poweroff() async {
    await wsChannel?.sink.close(status.goingAway);
  }
}
