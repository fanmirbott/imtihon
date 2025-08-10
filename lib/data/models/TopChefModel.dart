class TopChefModel {
  final String profilePhoto;
  final String firstName;


  TopChefModel({
    required this.firstName,
    required this.profilePhoto,
  });

  factory TopChefModel.fromJson(Map<String, dynamic> json) {
    return TopChefModel(
        profilePhoto: json['profilePhoto'],
        firstName: json['firstName'],
    );
  }
}
