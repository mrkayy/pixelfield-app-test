import 'package:dio/dio.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';

abstract interface class OnboardingInterface {
  Future<({ErrorParser? err, Response? response})> userSignin(
    RequestPayload data,
  );
}
