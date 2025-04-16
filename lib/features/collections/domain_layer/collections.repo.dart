import 'package:dio/dio.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';

abstract interface class CollectionsRepo {
  Future<({ErrorParser err, Response response})> loadCollectionsFromJson();
  Future<({ErrorParser err, Response response})> loadSingleCollectionFromJson(
    RequestPayload data,
  );
  Future<({ErrorParser err, Response response})> updateSingleCollectionFromJson(
    RequestPayload data,
  );
}
