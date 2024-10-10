// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileDataModel _$ProfileDataModelFromJson(Map<String, dynamic> json) =>
    ProfileDataModel(
      id: (json['id'] as num?)?.toInt(),
      firstName: json['first_name'] as String,
      secondName: json['second_name'] as String,
      email: json['email'] as String,
      purpose: json['purpose'] as String,
      college: json['college'] as String?,
      university: json['university'] as String?,
      deptName: json['dept_name'] as String?,
      admissionNo: json['admission_no'] as String?,
      clgRegno: json['clg_regno'] as String?,
      clgIdPic: json['clg_id_pic'] as String?,
      companyName: json['company_name'] as String?,
      companyId: json['company_id'] as String?,
      companyLocation: json['company_location'] as String?,
      country: (json['country'] as num?)?.toInt(),
      stateId: (json['state_id'] as num).toInt(),
      districtId: (json['district_id'] as num).toInt(),
      contactNo: json['contact_no'] as String,
      whatsappNo: json['whatsapp_no'] as String,
      otp: json['otp'] as String,
      otpStatus: json['otp_status'] as String,
      passwordHash: json['password_hash'] as String,
      authKey: json['auth_key'] as String,
      passwordResetToken: json['password_reset_token'] as String?,
      verificationToken: json['verification_token'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: (json['created_at'] as num).toInt(),
      updatedAt: (json['updated_at'] as num).toInt(),
      createdBy: (json['created_by'] as num).toInt(),
      updatedBy: (json['updated_by'] as num).toInt(),
    );

Map<String, dynamic> _$ProfileDataModelToJson(ProfileDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'second_name': instance.secondName,
      'email': instance.email,
      'purpose': instance.purpose,
      'college': instance.college,
      'university': instance.university,
      'dept_name': instance.deptName,
      'admission_no': instance.admissionNo,
      'clg_regno': instance.clgRegno,
      'clg_id_pic': instance.clgIdPic,
      'company_name': instance.companyName,
      'company_id': instance.companyId,
      'company_location': instance.companyLocation,
      'country': instance.country,
      'state_id': instance.stateId,
      'district_id': instance.districtId,
      'contact_no': instance.contactNo,
      'whatsapp_no': instance.whatsappNo,
      'otp': instance.otp,
      'otp_status': instance.otpStatus,
      'password_hash': instance.passwordHash,
      'auth_key': instance.authKey,
      'password_reset_token': instance.passwordResetToken,
      'verification_token': instance.verificationToken,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };
