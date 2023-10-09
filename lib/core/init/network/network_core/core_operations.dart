part of '../core_dio.dart';

extension _CoreDioOperations on CoreDio {
  R? _responseParser<R>(BaseModel model, dynamic data) {
    if (data is List<Map<String, dynamic>>) {
      return data.map((e) => model.fromJson(e)).toList().cast() as R;
    } else if (data is Map) {
      return model.fromJson(data as Map<String, dynamic>) as R;
    }
    return data as R?;
  }
}