class User {
  String? name;
  String? uid;
  String? email;
  String? profilePhoto;

  User({this.name, this.uid, this.email, this.profilePhoto});

  Map<String, dynamic> toMap(User user) {
    Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = user.uid;
    data['email'] = user.email;
    data['name'] = user.name;
    data['profile_photo'] = user.profilePhoto;
    return data;
  }

  User.fromMap(Map<dynamic, dynamic> data) {
    uid = data['uid'];
    email = data['email'];
    name = data['name'];
    profilePhoto = data['profile_photo'];
  }
}
