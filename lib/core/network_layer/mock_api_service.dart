import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MockApiServie {
  Future<Map<String, dynamic>> fetchData(String uri) async {
    try {
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(uri);
      // Parse the JSON string into a Map
      final Map<String, dynamic> data = jsonDecode(jsonString);
      return data;
    } catch (e, stacktrace) {
      debugPrint("STACK: $stacktrace");
      throw Exception('Failed to load mock data: $e');
    }
  }
}
