import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start OPTtaqnyat Group Code

class OPTtaqnyatGroup {
  static String getBaseUrl() => 'https://api.taqnyat.sa';
  static Map<String, String> headers = {};
  static GenerateNewOTPCall generateNewOTPCall = GenerateNewOTPCall();
}

class GenerateNewOTPCall {
  Future<ApiCallResponse> call({
    String? numbers = '',
    String? sender = 'fareed',
    String? method = 'sms',
    String? lang = 'ar',
    String? requestId = '1',
    String? returnJson = '1',
  }) async {
    final baseUrl = OPTtaqnyatGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'Generate new OTP',
      apiUrl: '${baseUrl}/verify.php',
      callType: ApiCallType.POST,
      headers: {
        'apiKey': '5452e5caefff7e0a1543506418d26ee2',
      },
      params: {
        'numbers': numbers,
        'sender': "fareed",
        'method': "sms",
        'lang': "ar",
        'requestId': "1",
        'returnJson': "1",
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End OPTtaqnyat Group Code

/// Start Google Group Code

class GoogleGroup {
  static String getBaseUrl() => 'https://firestore.googleapis.com/v1';
  static Map<String, String> headers = {};
  static PaymentsCall paymentsCall = PaymentsCall();
}

class PaymentsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = GoogleGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'payments',
      apiUrl:
          '${baseUrl}/projects/maknooz-jjnjgx/databases/(default)/documents/payments/',
      callType: ApiCallType.POST,
      headers: {
        'key': 'AIzaSyCaVxewFBYCSWNL1JxuX3Ur1tU0OFje1Y8',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Google Group Code

class MyfatoorahCall {
  static Future<ApiCallResponse> call() async {
    final ffApiRequestBody = '''
{
  "InvoiceAmount": 3,
  "CurrencyIso": "SAR"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'myfatoorah',
      apiUrl: 'https://api-sa.myfatoorah.com/v2/InitiatePayment',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'bearer 7V0FCLqVxWynk1yqq64otj-WPqaGINo_vgilZr5kkJvQaw1AAeBAWnU-tufw49Gi4yJU8bMwCYP-Di2lme2PAMCk1j72xKrc1jqiYh64m6ZIyiGA5Ve945CWyPjLWH0IQjIi8d1-V01711O0ajSWcj_0zu4BugLRkYKFkhdJBY6ukpQKgP9bujahQmfH2x7h7jyEm4BWc6lVBZLc837-djQnZbErpN6D18zlrYMJzy_h3w2mt2xZ1tNuZg1-_8c-muS6PVJqyqDi0bmo_sBV3LEZhsLQG1TMgdQakcfOqvykMKEadogD1gTaLZIZNt8Es8W5NV--vPfiKcEahlyeY7MESsf1rd6jgH9DW66W6QR_jtJhz7vc-iWjv-vvEEsh1EdiPPZJ1BCnHJaUOCRXhxGqh1kvgvngDFbawecY3KciIyCXKWk1cR5Gi0nj1vhu29BlnL1vybxM4fSkUmgE7FjIEk1wnRoILVAjjAcNwhprG0EZTIXApYrxrENpyItrSNSKlEH8adyhwTL7PXg7ptegLXVrjNRazbygDKm88LU5YeDetQXu86ggep1aCfgnJXpqia-Y5Knou0z9QI8ACCVKuCVZ8YjH4VhCWFRtSqrsfoJL0ITgYjNDmeqG44mAYegZ3hQAwQXPYtFs6UInjnXXxsASIN7dCcL4ZWbFpDgSbb3M',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
