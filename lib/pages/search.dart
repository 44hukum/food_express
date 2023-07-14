import 'package:flutter/material.dart';
import 'package:foodcommerce/model/products.dart';
import 'package:foodcommerce/widgets/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchLandingPage extends StatefulWidget {
  @override
  _SearchLandingPageState createState() => _SearchLandingPageState();
}

class _SearchLandingPageState extends State<SearchLandingPage> {
  TextEditingController _searchController = TextEditingController();

  List<dynamic> _searchResults = [];

  String _rememberedInput = ''; // Variable to remember user input

  @override
  void initState() {
    super.initState();
    // Retrieve and set the remembered user input
    _searchController.text = _retrieveRememberedInput();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _performSearch(String searchTerm) async {
    final baseUrl = Uri.http('10.0.2.2:8000', 'api/search_products');
    final url = Uri.parse('$baseUrl/?search=$searchTerm');
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    List<ProductModel> products =
        decodedResponse['results'].map<ProductModel>((json) {
      return ProductModel.fromJson(json);
    }).toList();
    List returnData =
        List.generate(products.length, (index) => products[index].toJson());

    setState(() {
      if (searchTerm.isNotEmpty) {
        _searchResults = returnData;
      } else {
        _searchResults.clear();
      }
    });
    print(returnData);
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults.clear();
    });
  }

  void _rememberInput() {
    // Save the user input for future use
    String userInput = _searchController.text.trim();
    _rememberedInput = userInput;
  }

  String _retrieveRememberedInput() {
    // Retrieve the remembered user input
    return _rememberedInput;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            border: Border.all(color: Colors.black),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => _performSearch(_searchController.text.trim()),
              ),
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: _searchController,
                  decoration: const InputDecoration(
                    hintText: 'Search for a food item',
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    fontSize: 18.0,
                  ),
                  onSubmitted: (value) {
                    _performSearch(_searchController.text.trim());
                    _rememberInput();
                    FocusScope.of(context).unfocus(); // Hide the keyboard
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: _clearSearch,
              ),
            ],
          ),
        ),
      ),
      body: _searchResults.isNotEmpty
          ? ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                print(_searchResults[index]);
                return Products(
                    logo: _searchResults[index]['pimage'],
                    product_name: _searchResults[index]['pname'],
                    price: _searchResults[index]['pprice'],
                    description: _searchResults[index]['pdescription'],
                    public_id: _searchResults[index]['pid']);
              },
            )
          : const Center(
              child: Text(
                'No search results found',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
    );
  }
}
