import 'dart:async';
import 'dart:ffi';

import 'package:rxdart/subjects.dart';
import 'package:task/domain/model/property_model.dart';
import 'package:task/domain/useCase/property_useCase.dart';
import 'package:task/presentation/base/baseviewmodel.dart';

import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_impl.dart';

class HomeViewModel extends BaseViewModel with HomeViewInput, HomeViewOut {
  final PropertyUseCase _propertyUseCase;

  HomeViewModel(this._propertyUseCase);

  final StreamController _streamController =
      BehaviorSubject<PropertyData>();

  @override
  void start() {
    getData();
  }

  getData() async {
    inputSate.add(LoadingState(
      stateRendererType: StateRendererType.fullScreenLoadingState,
    ));
    
    (await _propertyUseCase.execute(Void)).fold(
        (failure) => {
              inputSate.add(ErrorState(
                StateRendererType.fullScreenErrorState,
                failure.message,
              ))
            }, (data) {
      inputSate.add(ContentState());
      inputProperty.add(data);
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Sink get inputProperty => _streamController.sink;

  @override
  Stream<PropertyData> get outputProperty => _streamController.stream.map(( propertyData) => propertyData);
}

abstract class HomeViewInput {
  Sink get inputProperty;
}

abstract class HomeViewOut {
  Stream<PropertyData> get outputProperty;
}
