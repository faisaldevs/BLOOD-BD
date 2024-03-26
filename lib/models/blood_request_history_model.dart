class BloodRequestHistoryModel {
  int? id;
  String? userId;
  String? patientsName;
  String? bloodGroup;
  String? amountBag;
  String? date;
  String? time;
  String? healthIssue;
  Null hospitalName;
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
  User? user;

  BloodRequestHistoryModel(
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
        this.updatedAt,
        this.user});

  BloodRequestHistoryModel.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['patients_name'] = patientsName;
    data['blood_group'] = bloodGroup;
    data['amount_bag'] = amountBag;
    data['date'] = date;
    data['time'] = time;
    data['health_issue'] = healthIssue;
    data['hospital_name'] = hospitalName;
    data['division'] = division;
    data['district'] = district;
    data['upazila'] = upazila;
    data['union'] = union;
    data['address'] = address;
    data['contact_person_phone'] = contactPersonPhone;
    data['contact_person_name'] = contactPersonName;
    data['note'] = note;
    data['status'] = status;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
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
  Null emailVerifiedAt;
  String? image;
  String? profileVisibility;
  String? otp;
  String? ipAddress;
  String? status;
  String? createdByUserId;
  String? updatedByUserId;
  Null deletedAt;
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
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['user_type'] = userType;
    data['email'] = email;
    data['phone'] = phone;
    data['email_verified_at'] = emailVerifiedAt;
    data['image'] = image;
    data['profile_visibility'] = profileVisibility;
    data['otp'] = otp;
    data['ip_address'] = ipAddress;
    data['status'] = status;
    data['created_by_user_id'] = createdByUserId;
    data['updated_by_user_id'] = updatedByUserId;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
