class BannersListResponse {
  String? id;
  String? target;
  String? bannerImg;
  Parameters? parameters;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? type;
  String? label;

  BannersListResponse(
      {this.id,
      this.target,
      this.bannerImg,
      this.parameters,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.type,
      this.label});

  BannersListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    target = json['target'];
    bannerImg = json['banner_img'];
    parameters = json['parameters'] != null
        ? Parameters.fromJson(json['parameters'])
        : null;
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['target'] = target;
    data['banner_img'] = bannerImg;
    if (parameters != null) {
      data['parameters'] = parameters!.toJson();
    }
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['type'] = type;
    data['label'] = label;
    return data;
  }
}

class Parameters {
  String? productId;

  Parameters({this.productId});

  Parameters.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    return data;
  }
}
