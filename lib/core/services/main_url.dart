class MainUrl {
  final String mainUrl = "https://dummyjson.com";
  static String? _token;
  String get getToken => _token ?? "";
  set setToken(String token) => _token = token;
}
