class RequestStatusModel {
  String? message;
  List<Data>? data;

  RequestStatusModel({this.message, this.data});

  RequestStatusModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createdBy;
  int? userId;
  int? bloodRequestId;
  int? bloodRequestUserId;
  int? bloodDonorId;
  int? requestAmountBag;
  Null? approvedAmountBag;
  String? date;
  String? senderStatus;
  String? receiverStatus;
  int? senderViewStatus;
  int? receiverViewStatus;
  int? createdByUserId;
  int? updatedByUserId;
  String? createdAt;
  String? updatedAt;
  BloodDonor? bloodDonor;
  User? user;

  Data(
      {this.id,
        this.createdBy,
        this.userId,
        this.bloodRequestId,
        this.bloodRequestUserId,
        this.bloodDonorId,
        this.requestAmountBag,
        this.approvedAmountBag,
        this.date,
        this.senderStatus,
        this.receiverStatus,
        this.senderViewStatus,
        this.receiverViewStatus,
        this.createdByUserId,
        this.updatedByUserId,
        this.createdAt,
        this.updatedAt,
        this.bloodDonor,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    userId = json['user_id'];
    bloodRequestId = json['blood_request_id'];
    bloodRequestUserId = json['blood_request_user_id'];
    bloodDonorId = json['blood_donor_id'];
    requestAmountBag = json['request_amount_bag'];
    approvedAmountBag = json['approved_amount_bag'];
    date = json['date'];
    senderStatus = json['sender_status'];
    receiverStatus = json['receiver_status'];
    senderViewStatus = json['sender_view_status'];
    receiverViewStatus = json['receiver_view_status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    bloodDonor = json['blood_donor'] != null
        ? new BloodDonor.fromJson(json['blood_donor'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['user_id'] = this.userId;
    data['blood_request_id'] = this.bloodRequestId;
    data['blood_request_user_id'] = this.bloodRequestUserId;
    data['blood_donor_id'] = this.bloodDonorId;
    data['request_amount_bag'] = this.requestAmountBag;
    data['approved_amount_bag'] = this.approvedAmountBag;
    data['date'] = this.date;
    data['sender_status'] = this.senderStatus;
    data['receiver_status'] = this.receiverStatus;
    data['sender_view_status'] = this.senderViewStatus;
    data['receiver_view_status'] = this.receiverViewStatus;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.bloodDonor != null) {
      data['blood_donor'] = this.bloodDonor!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class BloodDonor {
  int? id;
  int? userId;
  String? bloodGroup;
  int? amountBag;
  String? healthIssue;
  String? division;
  String? district;
  String? upazila;
  String? union;
  String? address;
  String? contactPersonName;
  String? contactPersonPhone;
  Null? lastDonateDate;
  int? status;
  int? createdByUserId;
  int? updatedByUserId;
  String? createdAt;
  String? updatedAt;

  BloodDonor(
      {this.id,
        this.userId,
        this.bloodGroup,
        this.amountBag,
        this.healthIssue,
        this.division,
        this.district,
        this.upazila,
        this.union,
        this.address,
        this.contactPersonName,
        this.contactPersonPhone,
        this.lastDonateDate,
        this.status,
        this.createdByUserId,
        this.updatedByUserId,
        this.createdAt,
        this.updatedAt});

  BloodDonor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bloodGroup = json['blood_group'];
    amountBag = json['amount_bag'];
    healthIssue = json['health_issue'];
    division = json['division'];
    district = json['district'];
    upazila = json['upazila'];
    union = json['union'];
    address = json['address'];
    contactPersonName = json['contact_person_name'];
    contactPersonPhone = json['contact_person_phone'];
    lastDonateDate = json['last_donate_date'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['blood_group'] = this.bloodGroup;
    data['amount_bag'] = this.amountBag;
    data['health_issue'] = this.healthIssue;
    data['division'] = this.division;
    data['district'] = this.district;
    data['upazila'] = this.upazila;
    data['union'] = this.union;
    data['address'] = this.address;
    data['contact_person_name'] = this.contactPersonName;
    data['contact_person_phone'] = this.contactPersonPhone;
    data['last_donate_date'] = this.lastDonateDate;
    data['status'] = this.status;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  Null? username;
  String? userType;
  String? email;
  String? phone;
  Null? emailVerifiedAt;
  String? deviceToken;
  String? image;
  int? profileVisibility;
  Null? otp;
  String? ipAddress;
  int? status;
  int? donorStatus;
  int? donorProfileStatus;
  int? createdByUserId;
  int? updatedByUserId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.name,
        this.username,
        this.userType,
        this.email,
        this.phone,
        this.emailVerifiedAt,
        this.deviceToken,
        this.image,
        this.profileVisibility,
        this.otp,
        this.ipAddress,
        this.status,
        this.donorStatus,
        this.donorProfileStatus,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    userType = json['user_type'];
    email = json['email'];
    phone = json['phone'];
    emailVerifiedAt = json['email_verified_at'];
    deviceToken = json['device_token'];
    image = json['image'];
    profileVisibility = json['profile_visibility'];
    otp = json['otp'];
    ipAddress = json['ip_address'];
    status = json['status'];
    donorStatus = json['donor_status'];
    donorProfileStatus = json['donor_profile_status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['device_token'] = this.deviceToken;
    data['image'] = this.image;
    data['profile_visibility'] = this.profileVisibility;
    data['otp'] = this.otp;
    data['ip_address'] = this.ipAddress;
    data['status'] = this.status;
    data['donor_status'] = this.donorStatus;
    data['donor_profile_status'] = this.donorProfileStatus;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
