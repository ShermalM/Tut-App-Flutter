import 'package:complete_advanced_flutter/data/network/error_handler.dart';

class Failure {
  int code; // 200 or 400
  String message; // success or error

  Failure({
    required this.code,
    required this.message,
  });
}

class DefaultFailure extends Failure {
  DefaultFailure()
      : super(
          code: ResponseCode.DEFAULT,
          message: ResponseMessage.DEFAULT,
        );
}
