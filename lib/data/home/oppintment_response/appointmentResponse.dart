/// message : "Created Successfuly"
/// data : {"id":2000,"doctor":{"id":5,"name":"Ebony Ratke","email":"zhettinger@example.com","phone":"+14846525329","photo":"https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae","gender":"male","address":"59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859","description":"Sed quasi.","degree":"Specialist","specialization":{"id":6,"name":"Gynecology"},"city":{"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"},"patient":{"id":5192,"name":"momo","email":"momo1dad@gmail.com","phone":"01022558877","gender":"male"},"appointment_time":"Wednesday, December 17, 2025 2:00 PM","appointment_end_time":"Wednesday, December 17, 2025 2:30 PM","status":"pending","notes":"","appointment_price":300}
/// status : true
/// code : 201

class AppointmentResponse {
  AppointmentResponse({
      this.message, 
      this.data, 
      this.status, 
      this.code,});

  AppointmentResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? AppointmentData.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }
  String? message;
  AppointmentData? data;
  bool? status;
  int? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }

}

/// id : 2000
/// doctor : {"id":5,"name":"Ebony Ratke","email":"zhettinger@example.com","phone":"+14846525329","photo":"https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae","gender":"male","address":"59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859","description":"Sed quasi.","degree":"Specialist","specialization":{"id":6,"name":"Gynecology"},"city":{"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}},"appoint_price":300,"start_time":"14:00:00 PM","end_time":"20:00:00 PM"}
/// patient : {"id":5192,"name":"momo","email":"momo1dad@gmail.com","phone":"01022558877","gender":"male"}
/// appointment_time : "Wednesday, December 17, 2025 2:00 PM"
/// appointment_end_time : "Wednesday, December 17, 2025 2:30 PM"
/// status : "pending"
/// notes : ""
/// appointment_price : 300

class AppointmentData {
  AppointmentData({
      this.id, 
      this.doctor, 
      this.patient, 
      this.appointmentTime, 
      this.appointmentEndTime, 
      this.status, 
      this.notes, 
      this.appointmentPrice,});

  AppointmentData.fromJson(dynamic json) {
    id = json['id'];
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    patient = json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    appointmentTime = json['appointment_time'];
    appointmentEndTime = json['appointment_end_time'];
    status = json['status'];
    notes = json['notes'];
    appointmentPrice = json['appointment_price'];
  }
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentTime;
  String? appointmentEndTime;
  String? status;
  String? notes;
  int? appointmentPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (doctor != null) {
      map['doctor'] = doctor?.toJson();
    }
    if (patient != null) {
      map['patient'] = patient?.toJson();
    }
    map['appointment_time'] = appointmentTime;
    map['appointment_end_time'] = appointmentEndTime;
    map['status'] = status;
    map['notes'] = notes;
    map['appointment_price'] = appointmentPrice;
    return map;
  }

}

/// id : 5192
/// name : "momo"
/// email : "momo1dad@gmail.com"
/// phone : "01022558877"
/// gender : "male"

class Patient {
  Patient({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.gender,});

  Patient.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? gender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['gender'] = gender;
    return map;
  }

}

/// id : 5
/// name : "Ebony Ratke"
/// email : "zhettinger@example.com"
/// phone : "+14846525329"
/// photo : "https://via.placeholder.com/640x480.png/0044bb?text=doctors+repudiandae"
/// gender : "male"
/// address : "59456 Jena Shoals Apt. 622\nOsinskibury, SC 61859"
/// description : "Sed quasi."
/// degree : "Specialist"
/// specialization : {"id":6,"name":"Gynecology"}
/// city : {"id":20,"name":"Jordystad","governrate":{"id":9,"name":"fort"}}
/// appoint_price : 300
/// start_time : "14:00:00 PM"
/// end_time : "20:00:00 PM"

class Doctor {
  Doctor({
      this.id, 
      this.name, 
      this.email, 
      this.phone, 
      this.photo, 
      this.gender, 
      this.address, 
      this.description, 
      this.degree, 
      this.specialization, 
      this.city, 
      this.appointPrice, 
      this.startTime, 
      this.endTime,});

  Doctor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    photo = json['photo'];
    gender = json['gender'];
    address = json['address'];
    description = json['description'];
    degree = json['degree'];
    specialization = json['specialization'] != null ? Specialization.fromJson(json['specialization']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    appointPrice = json['appoint_price'];
    startTime = json['start_time'];
    endTime = json['end_time'];
  }
  int? id;
  String? name;
  String? email;
  String? phone;
  String? photo;
  String? gender;
  String? address;
  String? description;
  String? degree;
  Specialization? specialization;
  City? city;
  int? appointPrice;
  String? startTime;
  String? endTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    map['photo'] = photo;
    map['gender'] = gender;
    map['address'] = address;
    map['description'] = description;
    map['degree'] = degree;
    if (specialization != null) {
      map['specialization'] = specialization?.toJson();
    }
    if (city != null) {
      map['city'] = city?.toJson();
    }
    map['appoint_price'] = appointPrice;
    map['start_time'] = startTime;
    map['end_time'] = endTime;
    return map;
  }

}

/// id : 20
/// name : "Jordystad"
/// governrate : {"id":9,"name":"fort"}

class City {
  City({
      this.id, 
      this.name, 
      this.governrate,});

  City.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    governrate = json['governrate'] != null ? Governrate.fromJson(json['governrate']) : null;
  }
  int? id;
  String? name;
  Governrate? governrate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (governrate != null) {
      map['governrate'] = governrate?.toJson();
    }
    return map;
  }

}

/// id : 9
/// name : "fort"

class Governrate {
  Governrate({
      this.id, 
      this.name,});

  Governrate.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}

/// id : 6
/// name : "Gynecology"

class Specialization {
  Specialization({
      this.id, 
      this.name,});

  Specialization.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}