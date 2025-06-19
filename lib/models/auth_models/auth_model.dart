class AuthModel {
  AuthModel({required this.token, required this.refresh});
  late final String token;
  late final String refresh;

  AuthModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refresh = json['refresh'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, String>{};
    _data['token'] = token;
    _data['refresh'] = refresh;
    return _data;
  }
}
