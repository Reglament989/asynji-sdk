import "package:asynji_sdk/src/base/base_model.dart";
import "package:asynji_sdk/src/base/controllers/auth_controller.dart";
import "package:asynji_sdk/src/constants.dart";
import "package:flutter/src/widgets/framework.dart";
import 'package:flutter/widgets.dart';
import "package:hive/hive.dart";

class RoomController extends AuthController implements UiModel {
  dynamic roomBox;
  @override
  Future<void> init() async {
    roomBox = await Hive.openLazyBox(Constants.auth_controller_box);
    await super.init();
  }

  Future addNewRoom() async {}

  // Future

  Future getRoom(String id) async {
    return await roomBox.get(id);
  }

  @override
  Future<void> save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  // TODO: Add custom item builder for pass into room
  @override
  Widget render(
      {required Widget Function(BuildContext, int) itemBuilder,
      required Widget Function(BuildContext, int) separatorBuilder}) {
    return ValueListenableBuilder(
        valueListenable: roomBox.listenable(),
        builder: (BuildContext, room, _) => ListView.separated(
            itemBuilder: itemBuilder,
            separatorBuilder: separatorBuilder,
            itemCount: roomBox.values.lenght));
  }
}
