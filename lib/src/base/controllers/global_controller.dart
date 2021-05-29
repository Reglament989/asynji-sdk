import "package:asynji_sdk/src/base/base_model.dart" show BaseModel;
import "package:asynji_sdk/src/constants.dart";
import "package:dio/dio.dart" show Dio;
import "package:hive/hive.dart";

class GlobalController extends BaseModel {
  final baseUrl = "http://localhost:8080";
  late final Dio dio;

  GlobalController() {
    dio = Dio();
  }

  // TODO: Specific type for lazybox
  dynamic? globalOptions;
  @override
  Future<void> init() async {
    final lazyBox = await Hive.openBox(Constants.base_model_box);
    globalOptions = lazyBox.get("global");
    dio.options.baseUrl = baseUrl;
  }

  @override
  Future<void> save() async {
    await globalOptions.save();
  }

  Future<void> setUserId(String userId) async {
    globalOptions.userId = userId;
    await this.save();
  }
}
