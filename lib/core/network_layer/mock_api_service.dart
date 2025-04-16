import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class MockApiServie {
  Future<Map<String, dynamic>> fetchData(String uri) async {
    try {
      debugPrint("ALSO__GOT _TO_API");
      // Load the JSON file from assets
      final String jsonString = await rootBundle.loadString(uri);
      // Parse the JSON string into a Map
      final Map<String, dynamic> data = jsonDecode(jsonString);
      return data;
    } catch (e) {
      debugPrint("STOPPED _TO_API");
      throw Exception('Failed to load mock data: $e');
    }
  }
}
