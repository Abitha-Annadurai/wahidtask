class UserModel {
  final String name;
  final String description;
  final String stars;
  final String username;
  final String avatar;
  
  UserModel({required this.name, required this.description, required this.stars, required this.username,
    required this.avatar});
  
  factory UserModel.fromJSON(Map<String, dynamic> josn){
    return UserModel(name: josn['name'] ?? '',
        description: josn['description'] ?? '',
        stars: josn['owner']['starred_url'] ?? '',
        username: josn['full_name']?? '',
        avatar: josn['owner']['avatar_url']?? '');
  }
}