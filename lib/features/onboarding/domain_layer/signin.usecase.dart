import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/service_locator.dart';
import 'package:pixel_field_app/core/services/connectivity_service.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';
import 'package:pixel_field_app/features/onboarding/data_layer/user.model.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/entities/signin.entity.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/onboarding.interface.dart';

class SigninUserUsecase {
  SigninUserUsecase();

  final ConnectivityService connectivity = getIt<ConnectivityService>();
  final OnboardingInterface apiService = getIt<OnboardingInterface>();

  Future<({ErrorParser? err, UserSignin? user})> call(
    RequestPayload data,
  ) async {
    try {
      if (await connectivity.checkForConnectivity()) {
        var res = await apiService.userSignin(data);
        if (res.err == null) {
          if (res.response!.statusCode == 200) {
            var map = SigninModel.fromJson(res.response!.data) as UserSignin;
            return (err: null, user: map);
          }
          return (err: null, user: null);
        }
      }
      return (err: ErrorParser("User not found"), user: null);
    } catch (e) {
      return (err: ErrorParser("$e error"), user: null);
    }
  }
}
