import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodcommerce/model/products.dart';
import 'package:foodcommerce/model/restaurant.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class RestaurantInfoPage extends StatefulWidget {
  const RestaurantInfoPage({Key? key}) : super(key: key);

  @override
  State<RestaurantInfoPage> createState() => _RestaurantInfoPageState();
}

class _RestaurantInfoPageState extends State<RestaurantInfoPage> {
  final String openingHours =
      'Monday - Friday: 9:00 AM - 9:00 PM\nSaturday - Sunday: 10:00 AM - 8:00 PM';

  late Future futureRestaurantInfo;

  Future getRestaurantList() async {
    final url = Uri.http('10.0.2.2:8000', 'api/restaurant');
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    List<Restaurant> restaurant =
        decodedResponse['results'].map<Restaurant>((json) {
      return Restaurant.fromJson(json);
    }).toList();
    return restaurant[0].toJson();
  }

  @override
  void initState() {
    super.initState();
    futureRestaurantInfo = getRestaurantList();
  }

  void _makePhoneCall() async {
    final phoneNumber =
        '+9779845701618'; // Replace with the actual phone number
    final Uri phoneCallUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    if (await canLaunch(phoneCallUri.toString())) {
      await launch(phoneCallUri.toString());
    } else {
      throw 'Could not launch $phoneCallUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Restaurant Info'),
      ),
      body: FutureBuilder(
        future: futureRestaurantInfo,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  Center(
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data['rlogo']),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    snapshot.data['rname'],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.lock_clock),
                    title: const Text(
                      'Status:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data['rstatus'],
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.location_on),
                    title: const Text(
                      'Address:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data['raddress'],
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ListTile(
                    leading: const Icon(Icons.delivery_dining),
                    title: const Text(
                      'Delivery Time:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data['rdelivery_time'],
                      style: const TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.access_time),
                    title: Text(
                      'Opening Hours:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      openingHours,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.local_shipping),
                    title: Text(
                      'Delivery Fee:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'Rs ${snapshot.data['rdelivery_fee']}',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ListTile(
                    leading: Icon(Icons.local_phone),
                    title: Text(
                      'Phone Number:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      snapshot.data['rphone'],
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
