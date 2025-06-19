class EducationModel {
  EducationModel({
    required this.id,
    required this.universityName,
    required this.academicDegree,
    required this.collegeName,
    required this.major,
    required this.country,
    required this.graduationAt,
    this.deletedAt,
    required this.fileUrl,
    required this.consultantId,
  });
  late final String id;
  late final String universityName;
  late final String academicDegree;
  late final String collegeName;
  late final String major;
  late final String country;
  late final String graduationAt;
  late final Null deletedAt;
  late final String fileUrl;
  late final String consultantId;

  EducationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    universityName = json['university_name'];
    academicDegree = json['academic_degree'];
    collegeName = json['college_name'];
    major = json['major'];
    country = json['country'];
    graduationAt = json['graduation_at'];
    deletedAt = null;
    fileUrl = json['file_url'];
    consultantId = json['consultant_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['university_name'] = universityName;
    _data['academic_degree'] = academicDegree;
    _data['college_name'] = collegeName;
    _data['major'] = major;
    _data['country'] = country;
    _data['graduation_at'] = graduationAt;
    _data['deleted_at'] = deletedAt;
    _data['file_url'] = fileUrl;
    _data['consultant_id'] = consultantId;
    return _data;
  }
}
