import 'dart:async';

import 'package:rxdart/subjects.dart';

import '../common/state_renderer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInput
    with BaseViewModelOutput {
  //shared  variables and function that will be used through any view model

  final StreamController _inputStreamController =
      BehaviorSubject<StateFlow>();

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  void start() {
    
  }

  @override
  Sink get inputSate => _inputStreamController.sink;

  @override
  Stream<StateFlow> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);
}

abstract class BaseViewModelInput {
  void start(); //this start view model job
  void dispose(); //will be call when view model dispose

  Sink get inputSate;
}

abstract class BaseViewModelOutput {
  Stream<StateFlow> get outputState;
}
