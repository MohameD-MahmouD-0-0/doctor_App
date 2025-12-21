class AppointmentRequest {
  AppointmentRequest({
    this.doctorId,
    this.startTime,
    this.notes,
  });

  AppointmentRequest.fromJson(dynamic json) {
    doctorId = json['doctor_id'];
    startTime = json['start_time'];
    notes = json['notes'];
  }

  int? doctorId;
  String? startTime;
  String? notes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctor_id'] = doctorId;
    map['start_time'] = startTime;
    map['notes'] = notes;
    return map;
  }

  Map<String, String> toFormData() {
    return {
      'doctor_id': doctorId.toString(),
      'start_time': startTime ?? '',
      'notes': notes ?? '',
    };
  }
}
