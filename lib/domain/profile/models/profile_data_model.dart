import 'package:json_annotation/json_annotation.dart';
part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel {
  
  final int? id;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'second_name')
  final String secondName;
  final String email;
  final String purpose;
  final String? college;
  final String? university;
  @JsonKey(name: 'dept_name')
  final String? deptName;
  @JsonKey(name: 'admission_no')
  final String? admissionNo;
  @JsonKey(name: 'clg_regno')
  final String? clgRegno;
  @JsonKey(name: 'clg_id_pic')
  final String? clgIdPic;
  @JsonKey(name: 'company_name')
  final String? companyName;
  @JsonKey(name: 'company_id')
  final String? companyId;
  @JsonKey(name: 'company_location')
  final String? companyLocation;
  final int? country;
  @JsonKey(name: 'state_id')
  final int stateId;
  @JsonKey(name: 'district_id')
  final int districtId;
  @JsonKey(name: 'contact_no')
  final String contactNo;
  @JsonKey(name: 'whatsapp_no')
  final String whatsappNo;
  final String otp;
  @JsonKey(name: 'otp_status')
  final String otpStatus;
  @JsonKey(name: 'password_hash')
  final String passwordHash;
  @JsonKey(name: 'auth_key')
  final String authKey;
  @JsonKey(name: 'password_reset_token')
  final String? passwordResetToken;
  @JsonKey(name: 'verification_token')
  final String verificationToken;
  final int status;
  @JsonKey(name: 'created_at')
  final int createdAt;
  @JsonKey(name: 'updated_at')
  final int updatedAt;
  @JsonKey(name: 'created_by')
  final int createdBy;
  @JsonKey(name: 'updated_by')
  final int updatedBy;

  ProfileDataModel({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.purpose,
    this.college,
    this.university,
    this.deptName,
    this.admissionNo,
    this.clgRegno,
    this.clgIdPic,
    this.companyName,
    this.companyId,
    this.companyLocation,
    required this.country,
    required this.stateId,
    required this.districtId,
    required this.contactNo,
    required this.whatsappNo,
    required this.otp,
    required this.otpStatus,
    required this.passwordHash,
    required this.authKey,
    this.passwordResetToken,
    required this.verificationToken,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.updatedBy,
  });

  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);
}
