import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/shared_values.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class PreferencesSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> removeToken();
}

class PreferencesSourceImpl implements PreferencesSource {
  final FlutterSecureStorage shared;

  PreferencesSourceImpl({required this.shared});

  @override
  Future<String?> getToken() async {
    try {
      return shared.read(key: USER_TOKEN);
    } catch (e) {
      throw LocalException();
    }
  }

  @override
  Future<void> saveToken(String token) async {
    try {
      shared.write(
        key: USER_TOKEN,
        value: token,
      );
    } catch (e) {
      throw LocalException();
    }
  }

  @override
  Future<void> removeToken() async {
    try {
      shared.delete(key: USER_TOKEN);
    } catch (e) {
      throw LocalException();
    }
  }
}
