part of 'loading_bloc.dart';

abstract class LoadingEvent extends Equatable {
  const LoadingEvent();
}

class LoadingErrorEvent extends LoadingEvent {
  final String error;
  LoadingErrorEvent(this.error);
  @override
  List<Object> get props => [error];
}

class LoadingNoNumbersEvent extends LoadingEvent {
  @override
  List<Object> get props => [];
}

class LoadingSuccessEvent extends LoadingEvent {
  @override
  List<Object> get props => [];
}
