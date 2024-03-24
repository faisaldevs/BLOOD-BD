class BloodBankModel {
  int? id;
  String? clubName;
  String? contactPerson;
  String? email;
  String? phones;
  String? division;
  String? district;
  String? upazila;
  String? union;
  String? address;
  String? image;
  String? status;
  String? createdByUserId;
  String? updatedByUserId;
  Null? deletedAt;
  String? createdAt;
  String? updatedAt;
  String? userId;

  BloodBankModel(
      {this.id,
        this.clubName,
        this.contactPerson,
        this.email,
        this.phones,
        this.division,
        this.district,
        this.upazila,
        this.union,
        this.address,
        this.image,
        this.status,
        this.createdByUserId,
        this.updatedByUserId,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
        this.userId});

  BloodBankModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clubName = json['club_name'];
    contactPerson = json['contact_person'];
    email = json['email'];
    phones = json['phones'];
    division = json['division'];
    district = json['district'];
    upazila = json['upazila'];
    union = json['union'];
    address = json['address'];
    image = json['image'];
    status = json['status'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['club_name'] = this.clubName;
    data['contact_person'] = this.contactPerson;
    data['email'] = this.email;
    data['phones'] = this.phones;
    data['division'] = this.division;
    data['district'] = this.district;
    data['upazila'] = this.upazila;
    data['union'] = this.union;
    data['address'] = this.address;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userId;
    return data;
  }
}
