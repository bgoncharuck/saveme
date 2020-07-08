part of 'loading_bloc.dart';

abstract class LoadingState extends Equatable {
  const LoadingState();
}

class LoadingInitial extends LoadingState {
  @override
  List<Object> get props => [];
}

class LoadingError extends LoadingState {
  final error;
  LoadingError(this.error);
  @override
  List<Object> get props => [error];
}

class LoadingNoNumbers extends LoadingState {
  final done = "done";
  @override
  List<Object> get props => [done];
}

class LoadingSuccess extends LoadingState {
  final done = "done";
  @override
  List<Object> get props => [done];
}
