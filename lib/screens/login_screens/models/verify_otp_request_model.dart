class VerifyOtpRequestModel {
  final String otp;
  final String mobileNumber;

  VerifyOtpRequestModel({required this.otp, required this.mobileNumber});

  Map<String, dynamic> toJson() {
    return {
      "otp": otp,
      "mobile_number": mobileNumber,
    };
  }
}
