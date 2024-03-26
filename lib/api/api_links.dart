class ApiUrls{
  // ---------base Url------------------
static const String test = "https://starsoftjpn.xyz/api";
static const String live = "https://starsoftjpn.xyz/api";

// ---------Auth Url------------------
  static const auth = "$live/auth";

  static const String loginPost = "$auth/login";
  static const String signUpPost = "$auth/register";
  static const String profileGet = "$auth/profile";
  static const String profileUpdatePost = "$auth/profile-update";
  static const String donorStatusUpdatePost = "$auth/update-donor-status";
  static const String changePasswordPost = "$auth/change-password";
  static const String bloodRequestGet = "$auth/blood-request";
  static const String bloodRequestPost = "$auth/blood-request";
  static const String bloodRequestNotificationGet= "$auth/blood-request-notification";
  static const String bloodRequestNotificationPost= "$auth/blood-request-notification";
  static const String bloodRequestNotificationSenderStatusPost = "$auth/update-blood-request-sender-status";
  static const String bloodRequestNotificationReceiverStatusPost = "$auth/update-blood-request-receiver-status";
  static const String bloodDonorGet = "$auth/blood-donor";
  static const String bloodDonorPost = "$auth/blood-donor";
  static const String bloodDonorUpdatePost = "$auth/blood-donor-update";


  // ---------Location Url------------------

  static const api = "$live/v1";

  static const String signUpOtpPost = "$api/register-otp-check";
  static const String forgotPasswordPhonePost = "$api/forgot-password-by-phone";
  static const String forgotPasswordOtpPost = "$api/forgot-password-otp-check";
  static const String forgotPasswordPost = "$api/forgot-password-update";

  static const String divisionGet = "$api/division";
  static const String districtGet = "$api/district/1";
  static const String thanaGet = "$api/thana/1";
  static const String bloodRequestGetApi = "$api/blood-request";
  static const String bloodDonorGetApi = "$api/blood-donor";
  static const String bloodBankGet = "$api/club";
}