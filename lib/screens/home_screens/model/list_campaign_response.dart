class CampaignListResponse {
  String? id;
  String? title;
  String? description;
  String? type;
  bool? active;
  String? startTime;
  String? endTime;
  String? bannerType;
  BannerConfig? bannerConfig;

  CampaignListResponse(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.active,
      this.startTime,
      this.endTime,
      this.bannerType,
      this.bannerConfig});

  CampaignListResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    active = json['active'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    bannerType = json['banner_type'];
    bannerConfig = json['banner_config'] != null
        ? BannerConfig.fromJson(json['banner_config'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['type'] = type;
    data['active'] = active;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['banner_type'] = bannerType;
    if (bannerConfig != null) {
      data['banner_config'] = bannerConfig!.toJson();
    }
    return data;
  }
}

class BannerConfig {
  Css? css;
  String? title;
  String? tagline;
  String? ctaText;
  String? bannerIcon;
  String? description;
  String? bannerImage;
  String? titleTag;

  BannerConfig(
      {this.css,
      this.title,
      this.tagline,
      this.ctaText,
      this.bannerIcon,
      this.description,
      this.bannerImage,
      this.titleTag});

  BannerConfig.fromJson(Map<String, dynamic> json) {
    css = json['css'] != null ? Css.fromJson(json['css']) : null;
    title = json['title'];
    tagline = json['tagline'];
    ctaText = json['cta_text'];
    bannerIcon = json['banner_icon'];
    description = json['description'];
    bannerImage = json['banner_image'];
    titleTag = json['title_tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (css != null) {
      data['css'] = css!.toJson();
    }
    data['title'] = title;
    data['tagline'] = tagline;
    data['cta_text'] = ctaText;
    data['banner_icon'] = bannerIcon;
    data['description'] = description;
    data['banner_image'] = bannerImage;
    data['title_tag'] = titleTag;
    return data;
  }
}

class Css {
  String? ctaColor;
  String? themeColor;
  String? bannerGradientColor;

  Css({this.ctaColor, this.themeColor});

  Css.fromJson(Map<String, dynamic> json) {
    ctaColor = json['cta_color'];
    themeColor = json['theme_color'];
    bannerGradientColor = json['banner_gradient_color'];
    print("theme color ---- $themeColor");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cta_color'] = ctaColor;
    data['theme_color'] = themeColor;
    data['banner_gradient_color'] = themeColor;
    return data;
  }
}
