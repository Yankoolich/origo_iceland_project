import 'dart:async';

import 'package:origo_iceland_project_app/models/main_model.dart';

class CommunicationHandler {
  static CommunicationHandler? _instance;
  static StreamController<MainModel>? _controller;

  static CommunicationHandler getInstance() {
    _instance ??= CommunicationHandler();
    return _instance!;
  }

  static init() {
    _controller ??= StreamController.broadcast();
  }

  void emitMessage(MainModel model) {
    _controller?.add(model);
  }

  Stream<MainModel>? getStream() {
    return _controller?.stream;
  }

  cancelStream() {
    _controller!.close();
  }
}
