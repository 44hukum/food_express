
class User {
  final String public_id;
  final String username;
  final String access_token;
  final String refresh_token;

  User(this.public_id, this.username, this.access_token, this.refresh_token);

  User.fromJson(Map<String, dynamic> json)
      : public_id = json['user']['id'],
        username = json['user']['username'],
        refresh_token = json['refresh'],
        access_token = json['access'];

  Map<String, dynamic> toJson() => {
    'public_id': public_id,
    'username': username,
    'access_token': access_token,
    'refresh_token': refresh_token,

  };
}