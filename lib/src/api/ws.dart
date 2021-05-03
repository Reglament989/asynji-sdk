import 'dart:convert';

import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/io.dart';

Future startSync() async {
  final channel = IOWebSocketChannel.connect(Uri.parse('ws://localhost:51830'),
      pingInterval: Duration(seconds: 54),
      headers: {
        'X-Api-Key':
            'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2MjAwNTI0MjAsInVzZXJJZCI6IjYwOGZmZGNiOTFiMzI5NjY3ZTJiNTIzNiJ9.VWtH_pvwNdEnAx-aYaN0dUVhRCBilegArV8qGGfAZp5cvwtlWywezNk2elH6W5YZv0qMdi2Cy5syNIqNxD9nhA',
        'X-Topics': json.encode({
          'topics': [
            '608ffb3f91b329667e2b5235',
            '608fe70f91b3298ece43301e',
            '6090001791b3299b0fb1c871'
          ]
        })
      });

  channel.stream.listen((message) {
    final msg = json.decode(message);
    print(msg['Body']);
  });
}

main(List<String> args) {
  startSync();
}
