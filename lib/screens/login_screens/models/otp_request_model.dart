// models/otp_request_model.dart

class OtpRequestModel {
  final String recaptchaToken;
  final String mobileNumber;

  OtpRequestModel({required this.recaptchaToken, required this.mobileNumber});

  Map<String, dynamic> toJson() {
    return {
      "recaptcha_token": recaptchaToken,
      "mobile_number": mobileNumber,
    };
  }
}
