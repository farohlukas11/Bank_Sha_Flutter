import 'dart:convert';
import 'dart:async';

import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/shared_values.dart';
import 'package:bank_sha/data/models/signin_form_model.dart';
import 'package:bank_sha/data/models/signup_form_model.dart';
import 'package:http/http.dart' as http;

import '../../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<bool> checkEmail(SignUpFormModel model);

  Future<UserModel> signUp(SignUpFormModel model);

  Future<UserModel> signIn(SignInFormModel model);

  Future<String> logOut(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<bool> checkEmail(SignUpFormModel model) async {
    final response = await client.post(
      Uri.parse('$baseUrl/is-email-exist'),
      body: {
        'email': model.email,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['is_email_exist'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signIn(SignInFormModel model) async {
    final response = await client.post(
      Uri.parse('$baseUrl/login'),
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(
        jsonDecode(response.body),
      );
    } else {
      throw ServerException();
    }
  }

  @override
  Future<UserModel> signUp(SignUpFormModel model) async {
    final response = await client.post(
      Uri.parse('$baseUrl/register'),
      body: model.toJson(),
    );

    if (response.statusCode == 200) {
      UserModel user = UserModel.fromJson(
        jsonDecode(response.body),
      );
      user = user.copyWith(password: model.password);

      return user;
    } else if (response.statusCode == 400) {
      throw jsonDecode(response.body)['message'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> logOut(String token) async {
    final response = await client.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Token': token,
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException();
    }
  }
}
