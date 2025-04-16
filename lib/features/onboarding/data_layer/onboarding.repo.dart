import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pixel_field_app/core/network_layer/endpoints.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/network_layer/mock_api_service.dart';
import 'package:pixel_field_app/core/service_locator.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/onboarding.interface.dart';

class OnboardingUserRepository implements OnboardingInterface {
  @override
  Future<({ErrorParser? err, Response? response})> userSignin(
    RequestPayload data,
  ) async {
    try {
      debugPrint("GOT _TO_API");
      final res = await getIt<MockApiServie>().fetchData(Endpoints.user);
      for (final user in res["data"]) {
        debugPrint("MATCHINIG__DATA: $user");
        if (user['email'] == data['email'] &&
            user['password'] == data['password']) {
          return (
            err: null,
            response: Response(
              requestOptions: RequestOptions(),
              statusCode: 200,
              data: user,
            ),
          );
        }
      }
      return (
        err: null,
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 400,
          data: {"message": "${data["email"]} not found in local userdb.json"},
        ),
      );
    } catch (e) {
      return (err: ErrorParser("$e"), response: null);
    }
  }
}
