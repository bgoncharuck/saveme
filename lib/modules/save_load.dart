import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';

abstract class IStorageFile {
  Future<bool> Write({@required String data, @required String asFile});
  Future<String> Read({@required String fromFile});
}

class DefaultStorage implements IStorageFile {
  @override
  Future<bool> Write({@required String data, @required String asFile}) {}
  @override
  Future<String> Read({@required String fromFile}) {}
}

final IStorageFile storage = DefaultStorage();
