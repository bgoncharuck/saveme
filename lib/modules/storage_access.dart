import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

abstract class IStorageFile {
  Future<bool> write({@required String data, @required String asFile});
  //  @NULLABLE
  Future<String> read({@required String fromFile});
}

class DefaultStorage implements IStorageFile {
  Future<String> get _appDirPath async =>
      (await getApplicationDocumentsDirectory()).path;

  @override
  Future<bool> write({@required String data, @required String asFile}) async {
    if (await Permission.storage.request().isGranted == false) return false;
    return (File("${await _appDirPath}/$asFile")).writeAsString(data) != null;
  }

  //  @NULLABLE
  @override
  Future<String> read({@required String fromFile}) async {
    if (await Permission.storage.request().isGranted == false) return null;
    try {
      return (File("${await _appDirPath}/$fromFile")).readAsString();
    } catch (readError) {
      return null;
    }
  }
}
