import 'package:json_annotation/json_annotation.dart';
import 'package:pixel_field_app/features/onboarding/domain_layer/entities/signin.entity.dart';

part 'user.model.g.dart';

@JsonSerializable()
final class SigninModel extends UserSignin {
  SigninModel({
    super.email,
    super.firstname,
    super.id,
    super.lastname,
    super.password,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) =>
      _$SigninModelFromJson(json);
  Map<String, dynamic> toJson() => _$SigninModelToJson(this);
}
