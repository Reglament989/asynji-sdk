import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/io.dart';

Future startSync() async {
  final channel = IOWebSocketChannel.connect(Uri.parse('ws://localhost:51830'));

  channel.stream.listen((message) {
    print(message);
  });
}

main(List<String> args) {
  startSync();
}