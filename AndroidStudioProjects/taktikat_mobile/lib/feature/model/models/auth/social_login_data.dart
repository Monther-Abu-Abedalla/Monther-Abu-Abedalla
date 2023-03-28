class SocialLoginData {
  String? accessToken;
  String? providerId;
  String? provider;
  String? authTokenSecret;

  SocialLoginData({
    this.accessToken,
    this.providerId,
    this.provider,
    this.authTokenSecret,
  });


  SocialLoginData.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    providerId = json['provider_id'];
    provider = json['provider'];
    authTokenSecret = json['access_token_secret'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['provider_id'] = providerId;
    data['provider'] = provider;
    data['access_token_secret'] = authTokenSecret;
    return data;
  }
}
