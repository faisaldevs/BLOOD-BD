class MedicalHistoryModel {
  bool? success;
  List<Data>? data;

  MedicalHistoryModel({this.success, this.data});

  MedicalHistoryModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? instituteName;
  String? testDate;
  String? bloodGroup;
  int? hemoglobinLevel;
  String? hepatitis;
  String? malaria;
  int? bloodPressure;
  String? image;
  int? createdByUserId;
  int? updatedByUserId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.userId,
        this.instituteName,
        this.testDate,
        this.bloodGroup,
        this.hemoglobinLevel,
        this.hepatitis,
        this.malaria,
        this.bloodPressure,
        this.image,
        this.createdByUserId,
        this.updatedByUserId,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    instituteName = json['institute_name'];
    testDate = json['test_date'];
    bloodGroup = json['blood_group'];
    hemoglobinLevel = json['hemoglobin_level'];
    hepatitis = json['hepatitis'];
    malaria = json['malaria'];
    bloodPressure = json['blood_pressure'];
    image = json['image'];
    createdByUserId = json['created_by_user_id'];
    updatedByUserId = json['updated_by_user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['institute_name'] = this.instituteName;
    data['test_date'] = this.testDate;
    data['blood_group'] = this.bloodGroup;
    data['hemoglobin_level'] = this.hemoglobinLevel;
    data['hepatitis'] = this.hepatitis;
    data['malaria'] = this.malaria;
    data['blood_pressure'] = this.bloodPressure;
    data['image'] = this.image;
    data['created_by_user_id'] = this.createdByUserId;
    data['updated_by_user_id'] = this.updatedByUserId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
