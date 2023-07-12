
class User {
  final String public_id;
  final int id;
  final String username;
  final String access_token;
  final String refresh_token;

  User(this.public_id, this.id, this.username, this.access_token, this.refresh_token);

  User.fromJson(Map<String, dynamic> json)
      : public_id = json['user']['public_id'],
        username = json['user']['username'],
        id = json['user']['id'],
        refresh_token = json['refresh'],
        access_token = json['access'];

  Map<String, dynamic> toJson() => {
    'public_id': public_id,
    'id': id,
    'username': username,
    'access_token': access_token,
    'refresh_token': refresh_token,

  };
}