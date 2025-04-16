class AppConfig {
  AppConfig({this.apiKey, this.baseUrl, this.cacheDir});
  // api simulation; eg, Google Places Api
  final String? apiKey;
  final String? baseUrl;
  final String? cacheDir;

  @override
  String toString() =>
      "AppConfigs(baseUrl: $baseUrl, cacheDir: $cacheDir, apiKey: $apiKey)";
}
