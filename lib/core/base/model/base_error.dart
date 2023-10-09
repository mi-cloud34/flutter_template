
import 'package:flutter_architecture/core/init/network/IResponseModel.dart';

class BaseError<T> extends IErrorModel<T> {
  BaseError(this.message);
  final String message;
}