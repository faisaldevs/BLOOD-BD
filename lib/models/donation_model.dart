class DonationModel {
  List<Data>? data;

  DonationModel({this.data});

  DonationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? createdBy;
  String? userId;
  String? bloodRequestId;
  String? bloodDonorId;
  String? requestAmountBag;
  String? approvedAmountBag;
  String? date;
  String? senderStatus;
  String? receiverStatus;
  String? senderViewStatus;
  String? receiverViewStatus;
  String? createdByUserId;
  String? updatedByUserId;
  String? createdAt;
  String? updatedAt;
  BloodRequest? bloodRequest;
  User? user;

  Data(
      {this.id,
        this.createdBy,
        this.userId,
        this.bloodRequestId,
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
        this.bloodRequest,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdBy = json['created_by'];
    userId = json['user_id'];
    bloodRequestId = json['blood_request_id'];
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
    bloodRequest = json['blood_request'] != null
        ? new BloodRequest.fromJson(json['blood_request'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['created_by'] = this.createdBy;
    data['user_id'] = this.userId;
    data['blood_request_id'] = this.bloodRequestId;
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
    if (this.bloodRequest != null) {
      data['blood_request'] = this.bloodRequest!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class BloodRequest {
  int? id;
  String? userId;
  String? patientsName;
  String? bloodGroup;
  String? amountBag;
  String? date;
  String? time;
  String? healthIssue;
  String? hospitalName;
  String? division;
  String? district;
  String? upazila;
  String? union;
  String? address;
  String? contactPersonPhone;
  String? contactPersonName;
  String? note;
  String? status;
  String? createdByUserId;
  String? updatedByUserId;
  String? createdAt;
  String? updatedAt;

  BloodRequest(
      {this.id,
        this.userId,
        this.patientsName,
        this.bloodGroup,
        this.amountBag,
        this.date,
        this.time,
        this.healthIssue,
        this.hospitalName,
        this.division,
        this.district,
        this.upazila,
        this.union,
        this.address,
        this.contactPersonPhone,
        this.contactPersonName,
        this.note,
        this.status,
        this.createdByUserId,
        this.updatedByUserId,
        this.createdAt,
        this.updatedAt});

  BloodRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    patientsName = json['patients_name'];
    bloodGroup = json['blood_group'];
    amountBag = json['amount_bag'];
    date = json['date'];
    time = json['time'];
    healthIssue = json['health_issue'];
    hospitalName = json['hospital_name'];
    division = json['division'];
    district = json['district'];
    upazila = json['upazila'];
    union = json['union'];
    address = json['address'];
    contactPersonPhone = json['contact_person_phone'];
    contactPersonName = json['contact_person_name'];
    note = json['note'];
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
    data['patients_name'] = this.patientsName;
    data['blood_group'] = this.bloodGroup;
    data['amount_bag'] = this.amountBag;
    data['date'] = this.date;
    data['time'] = this.time;
    data['health_issue'] = this.healthIssue;
    data['hospital_name'] = this.hospitalName;
    data['division'] = this.division;
    data['district'] = this.district;
    data['upazila'] = this.upazila;
    data['union'] = this.union;
    data['address'] = this.address;
    data['contact_person_phone'] = this.contactPersonPhone;
    data['contact_person_name'] = this.contactPersonName;
    data['note'] = this.note;
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
  String? username;
  String? userType;
  String? email;
  String? phone;
  Null? emailVerifiedAt;
  String? image;
  String? profileVisibility;
  String? otp;
  String? ipAddress;
  String? status;
  String? donorStatus;
  String? donorProfileStatus;
  String? createdByUserId;
  String? updatedByUserId;
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
