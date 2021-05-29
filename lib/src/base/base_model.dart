import "package:flutter/widgets.dart";

abstract class BaseModel {
  Future<void> init();
  // Future<Widget> renderWidget();
  Future<void> save();
}

abstract class UiModel extends BaseModel {
  Widget render(
      {required Widget Function(BuildContext, int) itemBuilder,
      required Widget Function(BuildContext, int) separatorBuilder});
}
