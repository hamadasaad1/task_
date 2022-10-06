import 'dart:async';
import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/subjects.dart';
import 'package:task/app/dit.dart';
import 'package:task/domain/model/property_model.dart';
import 'package:task/domain/useCase/property_useCase.dart';

import '../../../common/state_renderer/state_renderer.dart';
import '../../../common/state_renderer/state_renderer_impl.dart';

part 'view_state.dart';

class ViewCubit extends Cubit<ViewState>
    with BaseViewModelInput, BaseViewModelOutput {
  ViewCubit() : super(ViewStateInitial());

  final PropertyUseCase _propertyUseCase = instance<PropertyUseCase>();

  final StreamController _inputStreamController =
      BehaviorSubject<StateFlow>();

  @override
  void dispose() {
    _inputStreamController.close();
  }

  @override
  Sink get inputSate => _inputStreamController.sink;

  @override
  Stream<StateFlow> get outputState =>
      _inputStreamController.stream.map((event) => event);

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

      emit(ViewStateSuccess(data));
    });
  }
}

abstract class BaseViewModelInput {
  void dispose(); //will be call when view model dispose

  Sink get inputSate;
}

abstract class BaseViewModelOutput {
  Stream<StateFlow> get outputState;
}
