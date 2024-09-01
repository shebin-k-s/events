class User {
  String firstName;
  String secondName;
  String email;
  String purpose;
  String country;
  String stateId;
  String districtId;
  String contactNo;
  String whatsappNo;
  String password;

  User({
    required this.firstName,
    required this.secondName,
    required this.email,
    required this.purpose,
    required this.country,
    required this.stateId,
    required this.districtId,
    required this.contactNo,
    required this.whatsappNo,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      secondName: json['second_name'],
      email: json['email'],
      purpose: json['purpose'],
      country: json['country'],
      stateId: json['state_id'],
      districtId: json['district_id'],
      contactNo: json['contact_no'],
      whatsappNo: json['whatsapp_no'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'second_name': secondName,
      'email': email,
      'purpose': purpose,
      'country': country,
      'state_id': stateId,
      'district_id': districtId,
      'contact_no': contactNo,
      'whatsapp_no': whatsappNo,
      'password': password,
    };
  }
}

class Student extends User {
  final String? college;
  final String? university;
  final String? deptName;
  final String? clgRegNo;
  final String? clgIdPic;

  Student({
    required String firstName,
    required String secondName,
    required String email,
    required String purpose,
    this.college,
    this.university,
    this.deptName,
    this.clgRegNo,
    this.clgIdPic,
    required String country,
    required String stateId,
    required String districtId,
    required String contactNo,
    required String whatsappNo,
    required String password,
  }) : super(
          firstName: firstName,
          secondName: secondName,
          email: email,
          purpose: purpose,
          country: country,
          stateId: stateId,
          districtId: districtId,
          contactNo: contactNo,
          whatsappNo: whatsappNo,
          password: password,
        );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
        firstName: json['first_name'],
        secondName: json['second_name'],
        email: json['email'],
        purpose: json['purpose'],
        college: json['college'],
        university: json['university'],
        deptName: json['dept_name'],
        clgRegNo: json['clg_regno'],
        clgIdPic: json['clg_id_pic'],
        country: json['country'],
        stateId: json['state_id'],
        districtId: json['district_id'],
        contactNo: json['contact_no'],
        whatsappNo: json['whatsapp_no'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'second_name': secondName,
        'email': email,
        'purpose': purpose,
        'college': college,
        'university': university,
        'dept_name': deptName,
        'clg_regno': clgRegNo,
        'clg_id_pic': clgIdPic,
        'country': country,
        'state_id': stateId,
        'district_id': districtId,
        'contact_no': contactNo,
        'whatsapp_no': whatsappNo,
        'password': password,
      };
}

class Employee extends User {
  final String? companyName;
  final String? companyLocation;
  final String? companyId;

  Employee({
    required String firstName,
    required String secondName,
    required String email,
    required String purpose,
    this.companyName,
    this.companyLocation,
    this.companyId,
    required String country,
    required String stateId,
    required String districtId,
    required String contactNo,
    required String whatsappNo,
    required String password,
  }) : super(
          firstName: firstName,
          secondName: secondName,
          email: email,
          purpose: purpose,
          country: country,
          stateId: stateId,
          districtId: districtId,
          contactNo: contactNo,
          whatsappNo: whatsappNo,
          password: password,
        );

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        firstName: json['first_name'],
        secondName: json['second_name'],
        email: json['email'],
        purpose: json['purpose'],
        companyName: json['company_name'],
        companyLocation: json['company_location'],
        companyId: json['company_id'],
        country: json['country'],
        stateId: json['state_id'],
        districtId: json['district_id'],
        contactNo: json['contact_no'],
        whatsappNo: json['whatsapp_no'],
        password: json['password'],
      );

  Map<String, dynamic> toJson() => {
        'first_name': firstName,
        'second_name': secondName,
        'email': email,
        'purpose': purpose,
        'company_name': companyName,
        'company_location': companyLocation,
        'company_id': companyId,
        'country': country,
        'state_id': stateId,
        'district_id': districtId,
        'contact_no': contactNo,
        'whatsapp_no': whatsappNo,
        'password': password,
      };
}

class Other extends User {
  Other({
    required super.firstName,
    required super.secondName,
    required super.email,
    required super.purpose,
    required super.country,
    required super.stateId,
    required super.districtId,
    required super.contactNo,
    required super.whatsappNo,
    required super.password,
  });

  factory Other.fromJson(Map<String, dynamic> json) {
    return Other(
      firstName: json['first_name'],
      secondName: json['second_name'],
      email: json['email'],
      purpose: json['purpose'],
      country: json['country'],
      stateId: json['state_id'],
      districtId: json['district_id'],
      contactNo: json['contact_no'],
      whatsappNo: json['whatsapp_no'],
      password: json['password'],
    );
  }
}
