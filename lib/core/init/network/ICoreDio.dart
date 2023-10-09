
import 'package:flutter_architecture/core/init/network/IResponseModel.dart';

import '../../base/model/base_model.dart';
import '../../constants/app/enums/http_request_enum.dart';

abstract class ICoreDio {

  Future<ResponseModel<R>> fetch<R, T extends BaseModel>(
  
    String path, {
    required HttpTypes type,
    required T parseModel,
    dynamic data,
    Map<String, dynamic>? queryParameters,
   
  });
  
}