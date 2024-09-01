// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      id: (json['id'] as num).toInt(),
      firstName: json['firstName'] as String,
      secondName: json['secondName'] as String,
      email: json['email'] as String,
      purpose: json['purpose'] as String,
      college: json['college'] as String?,
      university: json['university'] as String?,
      deptName: json['deptName'] as String?,
      admissionNo: json['admissionNo'] as String?,
      clgRegno: json['clgRegno'] as String?,
      clgIdPic: json['clgIdPic'] as String?,
      companyName: json['companyName'] as String?,
      companyId: json['companyId'] as String?,
      companyLocation: json['companyLocation'] as String?,
      country: (json['country'] as num).toInt(),
      stateId: (json['stateId'] as num).toInt(),
      districtId: (json['districtId'] as num).toInt(),
      contactNo: json['contactNo'] as String,
      whatsappNo: json['whatsappNo'] as String,
      otp: json['otp'] as String,
      otpStatus: json['otpStatus'] as String,
      passwordHash: json['passwordHash'] as String,
      authKey: json['authKey'] as String,
      passwordResetToken: json['passwordResetToken'] as String?,
      verificationToken: json['verificationToken'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: (json['createdAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      createdBy: (json['createdBy'] as num).toInt(),
      updatedBy: (json['updatedBy'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'email': instance.email,
      'purpose': instance.purpose,
      'college': instance.college,
      'university': instance.university,
      'deptName': instance.deptName,
      'admissionNo': instance.admissionNo,
      'clgRegno': instance.clgRegno,
      'clgIdPic': instance.clgIdPic,
      'companyName': instance.companyName,
      'companyId': instance.companyId,
      'companyLocation': instance.companyLocation,
      'country': instance.country,
      'stateId': instance.stateId,
      'districtId': instance.districtId,
      'contactNo': instance.contactNo,
      'whatsappNo': instance.whatsappNo,
      'otp': instance.otp,
      'otpStatus': instance.otpStatus,
      'passwordHash': instance.passwordHash,
      'authKey': instance.authKey,
      'passwordResetToken': instance.passwordResetToken,
      'verificationToken': instance.verificationToken,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'createdBy': instance.createdBy,
      'updatedBy': instance.updatedBy,
    };
