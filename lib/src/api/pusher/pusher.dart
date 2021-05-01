import 'dart:io';

// import 'package:firebase_core/firebase_core.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

class Pusher {
  Future init() async {
    if (Platform.isAndroid | Platform.isIOS | Platform.isMacOS) {
      // await Firebase.initializeApp();
    }
    startWebsocketSync();
  }
}

startWebsocketSync() {
  final channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
  // channel.transformStream(transformer)
  channel.sink.add('Hello');
  channel.stream.listen((event) {
    print(event.runtimeType);
    channel.sink.add(event);
    // channel.sink.close(status.goingAway);
  });
}

main(List<String> args) {
  startWebsocketSync();
}
