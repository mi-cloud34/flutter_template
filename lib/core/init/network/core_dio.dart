
import 'package:dio/dio.dart';
import 'package:flutter_architecture/core/base/model/base_model.dart';
part './network_core/core_operations.dart';

   class CoreDio with DioMixin implements Dio {
   @override
     // ignore: overridden_fields
     final BaseOptions options;//LateError (LateInitializationError: Field 'options' has already been initialized.)

  CoreDio(this.options) {
    options = options;
    interceptors.add(InterceptorsWrapper());
  }

  
  //Future<Response<T>>? Function<T>(RequestOptions requestOptions) {} 
  //@override
  /* // ignore: avoid_renaming_method_parameters
  Future<ResponseModel<R>> fetch<R, T extends BaseModel>(String path,
      {required HttpTypes type,
      required T parseModel,
      data,
      Map<String, Object>? queryParameters,
      void Function(int p1, int p2)? onReceiveProgress}) async {
         @override
 // Future<Response<T>>? Function<T>(RequestOptions requestOptions){}
    final response = await request(path,
        data: data, options: Options(method: type.rawValue));
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.accepted:
        final model = _responseParser<R?>(parseModel, _responseParser);
        return ResponseModel<R>(data: model);
      default:
        return ResponseModel(error: BaseError("message"));
    }
  } */
}
