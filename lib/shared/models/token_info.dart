class TokenInfo {
  TokenInfo({
    required this.tokenType,
    required this.expiresIn,
    required this.accessToken,
  });

  TokenInfo.fromJson(Map<String, dynamic> json) {
    tokenType = json['Type'];
    expiresIn = json['ExpiredIn'];
    accessToken = json['AccessToken'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['Type'] = tokenType;
    data['ExpiredIn'] = expiresIn;
    data['AccessToken'] = accessToken;

    return data;
  }

  late String tokenType;
  late int expiresIn;
  late String accessToken;
}
