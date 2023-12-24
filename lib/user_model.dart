class UserModel {
  final String name;
  final String description;
  final double stars;
  final String username;
  final String avatar;
  
  UserModel({required this.name, required this.description, required this.stars, required this.username,
    required this.avatar});
  
  factory UserModel.fromJson(Map<String, dynamic> josn){
    return UserModel(name: josn['name'] ?? '',
        description: josn['description'] ?? '',
        //stars: (josn['owner']['starred_url'] !=null) ? josn['owner']['starred_url'].toDouble() : null,
        stars: double.tryParse(josn['score'].toString()) ?? 0.0,
        username: josn['full_name']?? '',
        avatar: josn['owner']['avatar_url']?? '');
  }
}