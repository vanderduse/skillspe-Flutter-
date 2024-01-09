class VerifyOtpResponseModel {
  TokenDetails? tokenDetails;
  String? redirectTo;

  VerifyOtpResponseModel({this.tokenDetails, this.redirectTo});

  VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    tokenDetails = json['token_details'] != null
        ? TokenDetails.fromJson(json['token_details'])
        : null;
    redirectTo = json['redirect_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tokenDetails != null) {
      data['token_details'] = tokenDetails!.toJson();
    }
    data['redirect_to'] = redirectTo;
    return data;
  }
}

class TokenDetails {
  String? access;
  String? refresh;
  int? expiresAt;
  int? refreshExpiresAt;

  TokenDetails(
      {this.access, this.refresh, this.expiresAt, this.refreshExpiresAt});

  TokenDetails.fromJson(Map<String, dynamic> json) {
    access = json['access'];
    refresh = json['refresh'];
    expiresAt = json['expires_at'];
    refreshExpiresAt = json['refresh_expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access'] = access;
    data['refresh'] = refresh;
    data['expires_at'] = expiresAt;
    data['refresh_expires_at'] = refreshExpiresAt;
    return data;
  }
}
