import 'package:flutter/material.dart';

class SearchLandingPage extends StatefulWidget {
  @override
  _SearchLandingPageState createState() => _SearchLandingPageState();
}

class _SearchLandingPageState extends State<SearchLandingPage> {
  TextEditingController _searchController = TextEditingController();
  List<String> _foodItems = [
    'Pizza',
    'Burger',
    'Pasta',
    'Salad',
    'Sushi',
    'Tacos',
    'Steak',
  ];
  List<String> _searchResults = [];

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

  void _performSearch(String searchTerm) {
    setState(() {
      if (searchTerm.isNotEmpty) {
        _searchResults = _foodItems
            .where((food) =>
            food.toLowerCase().contains(searchTerm.toLowerCase()))
            .toList();
      } else {
        _searchResults.clear();
      }
    });
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
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            border: Border.all(
              color: Colors.black
            ),
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
                  style: TextStyle(
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: _searchResults.isNotEmpty
            ? ListView.builder(
          itemCount: _searchResults.length,
          itemBuilder: (context, index) {
            String foodItem = _searchResults[index];
            return Card(
              elevation: 4.0,
              child: ListTile(
                title: Text(
                  foodItem,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Icon(Icons.restaurant_menu),
                trailing: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    // Add the food item to the cart or perform an action
                  },
                ),
              ),
            );
          },
        )
            : Center(
          child: Text(
            'No search results found',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
