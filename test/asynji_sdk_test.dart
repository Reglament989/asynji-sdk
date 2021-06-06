import 'package:asynji_sdk/src/asynji_sdk_base.dart';
import 'package:test/test.dart';

void main() {
  test('Init all application', () async {
    final asynji = Asynji();
    await asynji.init();
  });
}
