import 'dart:convert';

import 'package:bank_sha/common/exception.dart';
import 'package:bank_sha/common/shared_values.dart';
import 'package:bank_sha/data/models/bank_model.dart';
import 'package:bank_sha/data/models/topup_form_model.dart';
import 'package:bank_sha/data/models/transfer_form_model.dart';

import 'package:http/http.dart' as http;

abstract class TransactionRemoteDataSource {
  Future<List<BankModel>> getPaymentMethod(String token);

  Future<String> topUpMethod(TopUpFormModel topUpFormModel, String token);

  Future<String> transferMethod(
      TransferFormModel transferFormModel, String token);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource {
  final http.Client client;

  TransactionRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BankModel>> getPaymentMethod(String token) async {
    final response = await client.get(
      Uri.parse('$baseUrl/payment_methods'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> list = jsonDecode(response.body);
      return list
          .map(
            (e) => BankModel.fromJson(e),
          )
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> topUpMethod(
      TopUpFormModel topUpFormModel, String token) async {
    final response = await client.post(
      Uri.parse('$baseUrl/top_ups'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: topUpFormModel.toJson(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['redirect_url'];
    } else {
      throw ServerException();
    }
  }

  @override
  Future<String> transferMethod(
      TransferFormModel transferFormModel, String token) async {
    final response = await client.post(
      Uri.parse('$baseUrl/transfers'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: transferFormModel.toJson(),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException();
    }
  }
}
