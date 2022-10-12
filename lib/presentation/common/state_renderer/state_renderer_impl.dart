import 'package:flutter/material.dart';

import 'package:task/presentation/common/state_renderer/state_renderer.dart';

import '../../../app/constants.dart';
import '../../resources/strings_manager.dart';


abstract class StateFlow {
  StateRendererType getStateRenderer();
  String getMessage();
}

//loading state

class LoadingState extends StateFlow {
  StateRendererType stateRendererType;
  String? message;
  LoadingState(
      {required this.stateRendererType, this.message = AppStrings.loading});

  @override
  String getMessage() {
    return message ?? AppStrings.loading;
  }

  @override
  StateRendererType getStateRenderer() {
    return stateRendererType;
  }
}

//error State

class ErrorState extends StateFlow {
  StateRendererType stateRendererType;
  String message;
  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRenderer() {
    return stateRendererType;
  }
}

//content state
class ContentState extends StateFlow {
  @override
  String getMessage() {
    return Constants.empty;
  }

  @override
  StateRendererType getStateRenderer() {
    return StateRendererType.contentState;
  }
}

// empty state
class EmptyState extends StateFlow {
  String message;
  EmptyState({
    required this.message,
  });

  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getStateRenderer() {
    return StateRendererType.fullScreenEmptyState;
  }
}

extension FlowStateExtension on StateFlow {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function reTryActionFunction) {
    switch (runtimeType) {
      case LoadingState:
        {
          if (getStateRenderer() == StateRendererType.popupLoadingState) {
            //show loading popup
            showPopupDialog(context, getStateRenderer(), getMessage());

            //show content
            return contentScreenWidget;
          } else {
            //full state loading screen

            return StateRenderer(
              message: getMessage(),
              stateRendererType: getStateRenderer(),
              retryActionFunction: reTryActionFunction,
            );
          }
        }

      case ErrorState:
        {
           dismissDialog(context);
          if (getStateRenderer() == StateRendererType.popupErrorState) {
            showPopupDialog(context, getStateRenderer(), getMessage());

//show content
            return contentScreenWidget;
          } else {
            return StateRenderer(
              retryActionFunction: reTryActionFunction,
              stateRendererType: getStateRenderer(),
              message: getMessage(),
            );
          }
        }
      case EmptyState:
        {
          return StateRenderer(
            retryActionFunction: () {},
            stateRendererType: getStateRenderer(),
            message: getMessage(),
          );
        }
      case ContentState:
        {
           dismissDialog(context);
          return contentScreenWidget;
        }
       
      default:
       dismissDialog(context);
        return contentScreenWidget;
    }
  }

//this function to check have dialog or not

  _isCurrentDialogShow(BuildContext context) =>
      ModalRoute.of(context)?.isCurrent != true;

  dismissDialog(BuildContext context) {
    if (_isCurrentDialogShow(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  showPopupDialog(BuildContext context, StateRendererType stateRendererType,
      String message) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenderer(
            retryActionFunction: () {},
            message: message,
            stateRendererType: stateRendererType)));
  }
}
