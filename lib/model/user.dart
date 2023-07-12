
class User {
  // final String public_id;
  final int id;
  final String username;
  final String access_token;
  final String refresh_token;

  User(this.id, this.username, this.access_token, this.refresh_token);

  User.fromJson(Map<String, dynamic> json)
      : username = json['user']['username'],
        id = json['user']['id'],
        refresh_token = json['refresh'],
        access_token = json['access'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'access_token': access_token,
    'refresh_token': refresh_token,

  };
}