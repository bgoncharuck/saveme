import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saveme/constants.dart';

part 'loading_event.dart';
part 'loading_state.dart';

Future loadingActions(@required LoadingBloc bloc) async {
  Map<Permission, PermissionStatus> statusOf;

  statusOf = await [
    Permission.phone,
    Permission.contacts,
  ].request();

  // contacts access, only debug message
  if (statusOf[Permission.contacts].isGranted)
    print("PermissionsCheck: Contacts access was granted.");

  // phone call access
  if (statusOf[Permission.phone].isGranted == false) {
    print("ERROR - PermissionsCheck: Phone call access was not granted.");
    bloc.add(LoadingErrorEvent(language.noCallingPermissionError));
    return;
  }
  print("PermissionsCheck: Phone call access was granted.");

  // if all okay
  bloc.add(await checkIfFilesExist());
}

class LoadingBloc extends Bloc<LoadingEvent, LoadingState> {
  LoadingBloc() : super(LoadingInitial());

  @override
  Stream<LoadingState> mapEventToState(
    LoadingEvent event,
  ) async* {
    if (event is LoadingSuccessEvent)
      yield LoadingSuccess();
    else if (event is LoadingErrorEvent)
      yield LoadingError(event.error);
    else if (event is LoadingNoNumbersEvent) yield LoadingNoNumbers();
  }
}

Future<LoadingEvent> checkIfFilesExist() async {
  // check if timer setting available from filesystem
  bool isNotNull = true;
  try {
    isNotNull = await callTimer.readTimerSettingFromFileSystem;
  } catch (fileNotExistError) {} finally {
    if (!isNotNull) callTimer.updateTimerSettingOnFileSystem;
  }
  // check if numbers list available from filesystem
  try {
    if (await numbers.readFromFileSystemIfAny) {
      print("DefaultRouteSetup: Completed.");
      if (numbers.atLeastOneNumberExist) return LoadingSuccessEvent();
    }
  } catch (fileNotExistError) {} finally {
    numbers.updateOnFileSystem;
  }
  // if not available or empty, then
  print("Warning - DefaultRouteSetup: Need at least one number.");
  return LoadingNoNumbersEvent();
}
