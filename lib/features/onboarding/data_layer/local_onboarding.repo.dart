import 'package:dio/dio.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/onboarding.interface.dart';

class LocalOnboardingUserRepository implements OnboardingInterface {
  @override
  Future<({ErrorParser? err, Response? response})> userSignin(
    RequestPayload data,
  ) async {
    try {



      return (
        err: null,
        response: Response(
          requestOptions: RequestOptions(),
          statusCode: 200,
          data: {},
        ),
      );
    } catch (e) {
      return (err: ErrorParser("$e"), response: null);
    }
  }
}
