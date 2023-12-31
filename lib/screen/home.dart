import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodcommerce/model/products.dart';
import 'package:foodcommerce/model/restaurant.dart';
import 'package:foodcommerce/widgets/products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantHome extends StatefulWidget {
  const RestaurantHome({Key? key}) : super(key: key);

  @override
  State<RestaurantHome> createState() => _RestaurantHomeState();
}

class _RestaurantHomeState extends State<RestaurantHome> {
  late Future futureRestaurant;
  late Future futureRestaurantMenu;

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

  Future getRestaurantProductList() async {
    final url = Uri.http('10.0.2.2:8000', 'api/products');
    var response = await http.get(url);
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    List<ProductModel> products =
        decodedResponse['results'].map<ProductModel>((json) {
      return ProductModel.fromJson(json);
    }).toList();
    return List.generate(products.length, (index) => products[index].toJson());
  }

  @override
  void initState() {
    super.initState();
    futureRestaurant = getRestaurantList();
    futureRestaurantMenu = getRestaurantProductList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              snap: false,
              floating: false,
              expandedHeight: 250,
              actions: [
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     const SnackBar(content: Text('This is a snackbar')));
                    Navigator.pushNamed(context, 'checkout');
                  },
                ),
              ],
              backgroundColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.light),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 290,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(14),
                          bottomRight: Radius.circular(0),
                        ),
                        image: DecorationImage(
                          image:
                              AssetImage('lib/assets/images/backgroound.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      right: 0,
                      child: FutureBuilder(
                          future: futureRestaurant,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return SizedBox(
                                  width: 133,
                                  height: 28,
                                  child: Stack(children: <Widget>[
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Container(
                                            width: 133,
                                            height: 28,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topLeft: Radius.circular(14),
                                                topRight: Radius.circular(0),
                                                bottomLeft: Radius.circular(14),
                                                bottomRight: Radius.circular(0),
                                              ),
                                              color: snapshot.data['rstatus'] ==
                                                      'open'
                                                  ? Color.fromRGBO(
                                                      52, 103, 81, 1)
                                                  : Colors.red,
                                            ))),
                                    Positioned(
                                        top: 2,
                                        left: 24,
                                        child: Text(
                                          '${snapshot.data['rstatus']}',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: snapshot.data['rstatus'] ==
                                                      'open'
                                                  ? Color.fromRGBO(
                                                      255, 255, 255, 1)
                                                  : Colors.white,
                                              fontFamily: 'SF Pro Display',
                                              fontSize: 16,
                                              letterSpacing:
                                                  0 /*percentages not used in flutter. defaulting to zero*/,
                                              fontWeight: FontWeight.normal,
                                              height: 1.3333333333333333),
                                        )),
                                    snapshot.data['rstatus'] == 'open'
                                        ? Positioned(
                                            top: 10,
                                            left: 8,
                                            child: Container(
                                                width: 8,
                                                height: 8,
                                                decoration: const BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color.fromRGBO(
                                                            0,
                                                            51,
                                                            17,
                                                            0.47450000047683716),
                                                        offset: Offset(
                                                            0.1484513133764267,
                                                            1.0562859773635864),
                                                        blurRadius:
                                                            2.133333444595337)
                                                  ],
                                                  gradient: LinearGradient(
                                                      begin: Alignment(
                                                          0.13917310535907745,
                                                          0.9902680516242981),
                                                      end: Alignment(
                                                          -0.9902680516242981,
                                                          0.13917310535907745),
                                                      colors: [
                                                        Color.fromRGBO(
                                                            0, 180, 61, 1),
                                                        Color.fromRGBO(
                                                            0, 255, 105, 1)
                                                      ]),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.elliptical(
                                                              8, 8)),
                                                )))
                                        : Container(),
                                  ]));
                            } else {
                              return const CircularProgressIndicator();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(right: 9.0, left: 9.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FutureBuilder(
                            future: futureRestaurant,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data['rname'],
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 18,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1.3333333333333333),
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }

                              // By default, show a loading spinner.
                            },
                          ),
                        ),
                        SizedBox(
                            width: 140,
                            height: 24,
                            child: Stack(children: <Widget>[
                              Positioned(
                                  top: 0,
                                  left: 0,
                                  child: Container(
                                      width: 140,
                                      height: 24,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(11),
                                          topRight: Radius.circular(11),
                                          bottomLeft: Radius.circular(11),
                                          bottomRight: Radius.circular(11),
                                        ),
                                        color: Colors.red,
                                      ))),
                              Positioned(
                                  top: 2,
                                  left: 10,
                                  child: FutureBuilder(
                                      future: futureRestaurant,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data['rdelivery_time'],
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'SF Pro Display',
                                                fontSize: 14,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1.3333333333333333),
                                          );
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      })),
                            ])),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                width: 300,
                                height: 24,
                                child: Stack(children: <Widget>[
                                  FutureBuilder(
                                    future: futureRestaurant,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Positioned(
                                            top: 4,
                                            left: 28,
                                            child: Text(
                                              snapshot.data['raddress'],
                                              textAlign: TextAlign.right,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(
                                                      22, 22, 22, 1),
                                                  fontFamily: 'SF Pro Display',
                                                  fontSize: 12,
                                                  letterSpacing: 0,
                                                  fontWeight: FontWeight.normal,
                                                  height: 1.3333333333333333),
                                            ));
                                      } else {
                                        return const CircularProgressIndicator();
                                      }
                                    },
                                  ),
                                  Positioned(
                                      top: 0,
                                      left: 0,
                                      child: SvgPicture.asset(
                                          'lib/assets/icons/location_two.svg',
                                          semanticsLabel: 'path')),
                                ])),
                          ],
                        ),
                        const SizedBox(height: 15),
                        FutureBuilder(
                          future: futureRestaurant,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    RichText(
                                        text: TextSpan(children: [
                                      WidgetSpan(
                                        child: SvgPicture.asset(
                                            'lib/assets/icons/time.svg',
                                            semanticsLabel: 'path'),
                                      ),
                                      const TextSpan(text: '  '),
                                      const TextSpan(
                                          text: '15-20 min',
                                          style:
                                              TextStyle(color: Colors.black)),
                                    ])),
                                    SvgPicture.asset(
                                        'lib/assets/icons/restaurant_vertical_line_1.svg',
                                        semanticsLabel: 'path'),
                                    Text(
                                      'Rs. ${snapshot.data['rdelivery_fee']}- Delivery Fee',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.3333333333333333),
                                    ),
                                    SvgPicture.asset(
                                        'lib/assets/icons/restaurant_vertical_line_1.svg',
                                        semanticsLabel: 'path'),
                                    const Text(
                                      '5 km away',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 14,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.normal,
                                          height: 1.3333333333333333),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'info');
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 30,
                              width: 50,
                              child: SvgPicture.asset(
                                  'lib/assets/icons/info.svg',
                                  semanticsLabel: 'path'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Info',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 14,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.bold,
                                      height: 1.4285714285714286),
                                ),
                                Text(
                                  'About Restaurants, Offers and Opening Hours',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color.fromRGBO(107, 107, 107, 1),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 12,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1.3333333333333333),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                              'lib/assets/icons/forward.svg',
                              semanticsLabel: 'path'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.dark),
              elevation: 0,
              collapsedHeight: 80,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 400,
                      height: 48,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        color: Colors.black,
                      ),
                      child: const TabBar(
                          splashBorderRadius:
                              BorderRadius.all(Radius.circular(11)),
                          padding: EdgeInsets.all(6),
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.white,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.red,
                          ),
                          tabs: [
                            Tab(
                                child: Text(
                              'Breakfast',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                            Tab(
                                child: Text(
                              'Lunch',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                            Tab(
                                child: Text(
                              'Dinner',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 18,
                                  letterSpacing:
                                      0 /*percentages not used in flutter. defaulting to zero*/,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            )),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(children: [
          ListView(
            padding: EdgeInsets.all(0),
            children: [
              FutureBuilder(
                  future: futureRestaurantMenu,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            children:
                                List.generate(snapshot.data.length, (index) {
                          return snapshot.data[index]['pcategory'] ==
                                  'Breakfast'
                              ? Products(
                                  public_id: snapshot.data[index]['pid'],
                                  logo: snapshot.data[index]['pimage'],
                                  product_name: snapshot.data[index]['pname'],
                                  price: snapshot.data[index]['pprice'],
                                  description: snapshot.data[index]
                                      ['pdescription'])
                              : Container();
                        })),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
          ListView(
            padding: EdgeInsets.all(0),
            children: [
              FutureBuilder(
                  future: futureRestaurantMenu,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            children:
                                List.generate(snapshot.data.length, (index) {
                          return snapshot.data[index]['pcategory'] == 'Lunch'
                              ? Products(
                                  public_id: snapshot.data[index]['pid'],
                                  logo: snapshot.data[index]['pimage'],
                                  product_name: snapshot.data[index]['pname'],
                                  price: snapshot.data[index]['pprice'],
                                  description: snapshot.data[index]
                                      ['pdescription'])
                              : Container();
                        })),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
          ListView(
            padding: EdgeInsets.all(0),
            children: [
              FutureBuilder(
                  future: futureRestaurantMenu,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                            children:
                                List.generate(snapshot.data.length, (index) {
                          return snapshot.data[index]['pcategory'] == 'Dinner'
                              ? Products(
                                  public_id: snapshot.data[index]['pid'],
                                  logo: snapshot.data[index]['pimage'],
                                  product_name: snapshot.data[index]['pname'],
                                  price: snapshot.data[index]['pprice'],
                                  description: snapshot.data[index]
                                      ['pdescription'])
                              : Container();
                        })),
                      );
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ],
          ),
        ]),
      ),
    );
  }
}
