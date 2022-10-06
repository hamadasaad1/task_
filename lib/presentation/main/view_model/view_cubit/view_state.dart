part of 'view_cubit.dart';

@immutable
abstract class ViewState {}

class ViewStateInitial extends ViewState {}

class ViewStateSuccess extends ViewState {
final   PropertyData data;
  ViewStateSuccess(this.data);
}
