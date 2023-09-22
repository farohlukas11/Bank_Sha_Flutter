import 'dart:convert';

import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/shared_values.dart';

import '../../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getUser(String token);

  Future<List<UserModel?>> getUserByUsername(String token, String username);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser(String token) async {
    final response = await client.get(
      Uri.parse('$baseUrl/users'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        jsonDecode(response.body),
      );
    } else if (response.statusCode == 401) {
      throw Exception401();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<UserModel?>> getUserByUsername(
    String token,
    String username,
  ) async {
    final response = await client.get(
      Uri.parse('$baseUrl/users/$username'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      return list
          .map(
            (e) => UserModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }
}
