class Loginresponse {
  late final String token;
  late final String refreshtoken;
  Loginresponse({required this.token, required this.refreshtoken});
  factory Loginresponse.fromjson(Map<String, dynamic> json) {
    return Loginresponse(
        token: json['token'], refreshtoken: json['refreshtoken']);
  }
}
