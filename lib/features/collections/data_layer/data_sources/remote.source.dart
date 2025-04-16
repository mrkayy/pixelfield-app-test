import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pixel_field_app/core/network_layer/error_parser.dart';
import 'package:pixel_field_app/core/utils/type_definition.dart';
import 'package:pixel_field_app/features/collections/domain_layer/collections.repo.dart';

class SimulatedCollectionsRepo implements CollectionsRepo {
  Future<Response> fakeApiRequester(RequestPayload payload) async {
    return await Future.delayed(const Duration(milliseconds: 2700), () {
      return ResponseBody.fromString(json.encode(payload), 200) as Response;
    });
  }


  @override
  Future<({ErrorParser err, Response response})> loadSingleCollectionFromJson(
    RequestPayload data,
  ) async {
    // TODO: implement loadSingleCollectionFromJson
    throw UnimplementedError();
  }

  @override
  Future<({ErrorParser err, Response response})> updateSingleCollectionFromJson(
    RequestPayload data,
  ) async {
    // TODO: implement updateSingleCollectionFromJson
    throw UnimplementedError();
  }
  
  @override
  Future<({ErrorParser err, Response response})> loadCollectionsFromJson() {
    // TODO: implement loadCollectionsFromJson
    throw UnimplementedError();
  }
}
