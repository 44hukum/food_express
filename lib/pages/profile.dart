import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  bool _isEditing = false;
  bool _isChangingPassword = false;
  String _password = '';

  @override
  void initState() {
    super.initState();
    // Set initial user details
    _firstNameController.text = 'John';
    _lastNameController.text = 'Doe';
    _addressController.text = '123 Street, City';
    _phoneNumberController.text = '123-456-7890';
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
    // Show a snackbar or perform additional actions
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
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60.0,
                  backgroundImage: AssetImage('lib/assets/images/restaurant.png'),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Profile Information',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  controller: _firstNameController,
                  enabled: _isEditing,
                  decoration: InputDecoration(labelText: 'First Name'),
                ),
                SizedBox(height: 10.0),
                TextFormField(
                  controller: _lastNameController,
                  enabled: _isEditing,
                  decoration: InputDecoration(labelText: 'Last Name'),
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
                        onPressed: _saveChanges,
                        child: Text('Save'),
                      ),
                      SizedBox(width: 10.0),
                      TextButton(
                        onPressed: _cancelChanges,
                        child: Text('Cancel'),
                      ),
                    ],
                  )
                else
                  ElevatedButton(
                    onPressed: _toggleEdit,
                    child: Text('Edit Profile'),
                  ),
                SizedBox(height: 20.0),
                Divider(),
                SizedBox(height: 20.0),
                Text(
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
                          ),
                          SizedBox(width: 10.0),
                          TextButton(
                            onPressed: _cancelPasswordChange,
                            child: Text('Cancel'),
                          ),
                        ],
                      ),
                    ],
                  )
                else
                  ElevatedButton(
                    onPressed: _toggleChangePassword,
                    child: Text('Change Password'),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
