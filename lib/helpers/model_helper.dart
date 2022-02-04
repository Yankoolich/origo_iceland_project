import 'package:origo_iceland_project_app/models/main_model.dart';

class ModelHelper {
  static late MainModel? _mainModel;

  static MainModel getCurrentModel() {
    return _mainModel!;
  }

  static void setCurrentModel(MainModel? user) {
    _mainModel = user;
  }
}
