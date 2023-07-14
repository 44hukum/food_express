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
  TextEditingController _newAddressController = TextEditingController();
  List<String> _deliveryAddresses = [];
  bool _isEditing = false;

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
    _newAddressController.dispose();
    super.dispose();
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _addNewAddress() {
    setState(() {
      final newAddress = _newAddressController.text;
      if (newAddress.isNotEmpty) {
        _deliveryAddresses.add(newAddress);
        _newAddressController.clear();
      }
    });
  }

  void _removeAddress(int index) {
    setState(() {
      _deliveryAddresses.removeAt(index);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
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
              decoration: InputDecoration(
                labelText: 'First Name',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _lastNameController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Last Name',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _addressController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Address',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              controller: _phoneNumberController,
              enabled: _isEditing,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Delivery Addresses',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            if (_deliveryAddresses.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                itemCount: _deliveryAddresses.length,
                itemBuilder: (context, index) {
                  final address = _deliveryAddresses[index];
                  return ListTile(
                    title: Text(address),
                    trailing: _isEditing
                        ? IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => _removeAddress(index),
                          )
                        : null,
                  );
                },
              ),
            const SizedBox(height: 10.0),
            if (_isEditing)
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _newAddressController,
                      decoration: const InputDecoration(
                        labelText: 'Add new address',
                        labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: _addNewAddress,
                  ),
                ],
              ),
            const SizedBox(height: 20.0),
            if (_isEditing)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _saveChanges,
                    child: const Text('Save'),
                  ),
                  const SizedBox(width: 10.0),
                  TextButton(
                    onPressed: _cancelChanges,
                    child: const Text('Cancel'),
                  ),
                ],
              )
            else
              ElevatedButton(
                onPressed: _toggleEdit,
                child: const Text('Edit Profile'),
              ),
          ],
        ),
      ),
    );
  }
}
