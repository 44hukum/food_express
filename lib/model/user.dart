
class User {
  // final String public_id;
  final int id;
  final String public_id;
  final String email;
  final String phonenumber;
  final String first_name;
  final String last_name;
  final String username;
  final String access_token;
  final String refresh_token;
  final String address;

  User(this.id, this.username, this.access_token, this.refresh_token, this.public_id, this.email,this.phonenumber, this.first_name, this.last_name, this.address);

  User.fromJson(Map<String, dynamic> json)
      : username = json['user']['username'],
        public_id = json['user']['public_id'],
        email = json['user']['email'],
        first_name = json['user']['first_name'],
        last_name = json['user']['last_name'],
        phonenumber = json['user']['phonenumber'],
        address = json['user']['address'],
        id = json['user']['id'],
        refresh_token = json['refresh'],
        access_token = json['access'];

  Map<String, dynamic> toJson() => {
    'id': id,
    'public_id': public_id,
    'email': email,
    'phonenumber': phonenumber,
    'address': address,
    'first_name': first_name,
    'last_name': last_name,
    'username': username,
    'access_token': access_token,
    'refresh_token': refresh_token,
  };
}