class UsersListResponse {
  String? userId;
  String? firstName;
  String? lastName;
  String? profileImgUrl;

  UsersListResponse({
    this.userId,
    this.firstName,
    this.lastName,
    this.profileImgUrl,
  });

  UsersListResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImgUrl = json['profile_img_url'];
  }

  get length => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_img_url'] = profileImgUrl;
    return data;
  }
}
