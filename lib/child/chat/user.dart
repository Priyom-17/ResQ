class AnUser {
  AnUser({
    required this.name,
    required this.gemail,
    required this.email,
    required this.id,
    required this.gender,

  });

  late String name;
  late String gemail;
  late String email;
  late String id;
  late String gender;


  AnUser.fromJson(Map<String, dynamic> json){

    name = json['name'] ?? '';
    email = json['email'] ?? '';
    gemail = json['gemail'] ?? '';
    id = json['id'] ?? '';
    gender = json['gender'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['gemail'] = gemail;
    data['id'] = id;
    data['gender'] = gender;
    return data;
  }
}