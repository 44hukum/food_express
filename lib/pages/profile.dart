import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodcommerce/model/user.dart';
import 'package:foodcommerce/services/session.dart';
import 'package:http/http.dart' as http;


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future user;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  bool _isEditing = false;
  bool _isChangingPassword = false;
  String _password = '';

  @override
  void initState() {
    super.initState();
    user = SessionManager().getUser();
    print(user);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _addressController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _toggleChangePassword() {
    setState(() {
      _isChangingPassword = !_isChangingPassword;
    });
  }

  void _saveChanges() {
    // Save changes to the user profile
    setState(() {
      _isEditing = false;
    });

  }
  void _showSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Profile updated',
          style: TextStyle(color: Colors.white),
        ),
        duration: Duration(seconds: 4),
        backgroundColor: Colors.green,
      ),

    );
  }

  void updateData(String public_id, String access, String refresh, Map<String, dynamic> data) async {
    final baseUrl = Uri.http('10.0.2.2:8000', 'api/user');
    final url = Uri.parse('$baseUrl/${public_id}/');

    final response = await http.put(
      url,
      headers: {
      'Content-Type': 'application/json',
        "Authorization": "Bearer $access",
      },
      body: jsonEncode(data),
    );

    // Handle the response
    if (response.statusCode == 200) {
      SessionManager().clearSession();
      final Map<String, dynamic> responseData = {
        'access': access,
        'refresh': refresh,
        'user': jsonDecode(response.body)
      };

      User user = User.fromJson(responseData);
      SessionManager().saveUser(user.toJson());
      print('session_updated');
      setState(() {
        _isEditing = false;
      });
      _showSnackbar();

    } else {
      // Error handling
      print('Error: ${response.body}');
    }
  }

  void _cancelChanges() {
    // Discard changes to the user profile
    setState(() {
      _isEditing = false;
    });
    // Show a snackbar or perform additional actions
  }

  void _savePassword() {
    // Save new password
    setState(() {
      _isChangingPassword = false;
    });
    // Show a snackbar or perform additional actions
  }

  void _cancelPasswordChange() {
    // Cancel password change
    setState(() {
      _isChangingPassword = false;
    });
    // Show a snackbar or perform additional actions
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
              if(snapshot.hasData){
                _firstNameController.text = snapshot.data['first_name'];
                _lastNameController.text = snapshot.data['last_name'];
                _addressController.text = snapshot.data['address'];
                _phoneNumberController.text = snapshot.data['phonenumber'];
                _emailController.text = snapshot.data['email'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage('lib/assets/images/restaurant.png'),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Profile Information',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      initialValue: '${snapshot.data['username']}',
                      enabled: false,
                      decoration: const InputDecoration(labelText: 'Username'),
                    ),

                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _firstNameController,
                      enabled: _isEditing,
                      decoration: const InputDecoration(labelText: 'First Name'),
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: _lastNameController,
                      enabled: _isEditing,
                      decoration: InputDecoration(labelText: 'Last Name'),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _emailController,
                      enabled: _isEditing,
                      decoration: InputDecoration(labelText: 'E-mail'),
                    ),

                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _addressController,
                      enabled: _isEditing,
                      decoration: InputDecoration(labelText: 'Address'),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _phoneNumberController,
                      enabled: _isEditing,
                      decoration: InputDecoration(labelText: 'Phone Number'),
                    ),
                    SizedBox(height: 20.0),

                    if (_isEditing)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            onPressed: (){
                              String publicId = snapshot.data['public_id'];
                              String accessToken = snapshot.data['access_token'];
                              String refreshToken = snapshot.data['access_token'];


                              Map<String, dynamic> data = {
                              "first_name": _firstNameController.text,
                              "phonenumber": _phoneNumberController.text,
                              "last_name": _lastNameController.text,
                                "username": snapshot.data['username'],
                              "email": _emailController.text,
                                "address": _addressController.text
                              };

                              updateData(publicId, accessToken, refreshToken, data);
                            },
                            child: Text('Save'),
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )
                            ),
                            onPressed: _cancelChanges,
                            child: Text('Cancel'),
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          ),
                          onPressed: _toggleEdit,
                          child: Text('Edit Profile'),
                        ),
                      ),
                    const SizedBox(height: 20.0),
                    Divider(),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Change Password',
                      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20.0),
                    if (_isChangingPassword)
                      Column(
                        children: [
                          TextFormField(
                            onChanged: (value) {
                              setState(() {
                                _password = value;
                              });
                            },
                            decoration: InputDecoration(labelText: 'New Password'),
                            obscureText: true,
                          ),
                          SizedBox(height: 10.0),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Confirm Password'),
                            obscureText: true,
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: _savePassword,
                                child: Text('Save'),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )
                                ),
                              ),
                              SizedBox(width: 10.0),
                              TextButton(
                                style: TextButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )
                                ),
                                onPressed: _cancelPasswordChange,
                                child: Text('Cancel'),
                              ),
                            ],
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        height: 40,
                        width: 200,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              )
                          ),
                          onPressed: _toggleChangePassword,
                          child: Text('Change Password'),
                        ),
                      ),

                  ],
                );
              }
              else{
                return CircularProgressIndicator();
              }
            },)


          ),
        ],
      ),
    );
  }
}
