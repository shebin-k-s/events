import 'package:json_annotation/json_annotation.dart';

part 'profile_data_model.g.dart';

@JsonSerializable()
class ProfileDataModel {
  final int id;
  final String firstName;
  final String secondName;
  final String email;
  final String purpose;
  final String? college;
  final String? university;
  final String? deptName;
  final String? admissionNo;
  final String? clgRegno;
  final String? clgIdPic;
  final String? companyName;
  final String? companyId;
  final String? companyLocation;
  final int country;
  final int stateId;
  final int districtId;
  final String contactNo;
  final String whatsappNo;
  final String otp;
  final String otpStatus;
  final String passwordHash;
  final String authKey;
  final String? passwordResetToken;
  final String verificationToken;
  final int status;
  final int createdAt;
  final int updatedAt;
  final int createdBy;
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

  // Factory method to create an instance from JSON
  factory ProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileDataModelFromJson(json);

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() => _$ProfileDataModelToJson(this);

  // Manually implemented copyWith method
  ProfileDataModel copyWith({
    int? id,
    String? firstName,
    String? secondName,
    String? email,
    String? purpose,
    String? college,
    String? university,
    String? deptName,
    String? admissionNo,
    String? clgRegno,
    String? clgIdPic,
    String? companyName,
    String? companyId,
    String? companyLocation,
    int? country,
    int? stateId,
    int? districtId,
    String? contactNo,
    String? whatsappNo,
    String? otp,
    String? otpStatus,
    String? passwordHash,
    String? authKey,
    String? passwordResetToken,
    String? verificationToken,
    int? status,
    int? createdAt,
    int? updatedAt,
    int? createdBy,
    int? updatedBy,
  }) {
    return ProfileDataModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      email: email ?? this.email,
      purpose: purpose ?? this.purpose,
      college: college ?? this.college,
      university: university ?? this.university,
      deptName: deptName ?? this.deptName,
      admissionNo: admissionNo ?? this.admissionNo,
      clgRegno: clgRegno ?? this.clgRegno,
      clgIdPic: clgIdPic ?? this.clgIdPic,
      companyName: companyName ?? this.companyName,
      companyId: companyId ?? this.companyId,
      companyLocation: companyLocation ?? this.companyLocation,
      country: country ?? this.country,
      stateId: stateId ?? this.stateId,
      districtId: districtId ?? this.districtId,
      contactNo: contactNo ?? this.contactNo,
      whatsappNo: whatsappNo ?? this.whatsappNo,
      otp: otp ?? this.otp,
      otpStatus: otpStatus ?? this.otpStatus,
      passwordHash: passwordHash ?? this.passwordHash,
      authKey: authKey ?? this.authKey,
      passwordResetToken: passwordResetToken ?? this.passwordResetToken,
      verificationToken: verificationToken ?? this.verificationToken,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      updatedBy: updatedBy ?? this.updatedBy,
    );
  }
}
