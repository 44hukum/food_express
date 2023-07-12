import 'package:flutter/material.dart';
import 'package:foodcommerce/services/cart.dart';
import 'package:provider/provider.dart';

class Products extends StatefulWidget {
  final String logo;
  final String public_id;
  final String product_name;
  final String price;
  final String description;
  const Products(
      {Key? key,
      required this.logo,
      required this.product_name,
      required this.price,
      required this.description,
      required this.public_id})
      : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool addToCart = false;
  int quantity = 0;
  bool itemsAddedToCart = false;
  late SqliteService _sqliteService;

  void addItemToCart(Orders order) {
    //add item
    _sqliteService = SqliteService();
    _sqliteService.initializeDB().whenComplete(() async {
      final data = await _sqliteService.createItem(order);
        if(data != null){
          setState(() {
            itemsAddedToCart = true;
          });
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = context.read<CartModel>();

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              addToCart == false ? addToCart = true : addToCart = false;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.logo), fit: BoxFit.cover),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.product_name,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Text(
                        'Rs. ${widget.price}',
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300,
                    child: Text(
                      widget.description,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          color: Color.fromRGBO(107, 107, 107, 1),
                          fontFamily: 'SF Pro Display',
                          fontSize: 10,
                          letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                          fontWeight: FontWeight.normal,
                          height: 2),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              addToCart == true
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (quantity > 0) {
                                quantity = quantity - 1;
                              } else {
                                quantity = 0;
                                cartProvider.removeAll();
                              }
                            });
                          },
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(236, 219, 186, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(24, 24)),
                                        ))),
                                const Positioned(
                                    bottom: 9,
                                    left: 0,
                                    child: Icon(Icons.minimize)),
                              ])),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '$quantity',
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              quantity = quantity + 1;
                            });
                          },
                          child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Stack(children: <Widget>[
                                Positioned(
                                    top: 0,
                                    left: 0,
                                    child: Container(
                                        width: 24,
                                        height: 24,
                                        decoration: const BoxDecoration(
                                          color:
                                              Color.fromRGBO(236, 219, 186, 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.elliptical(24, 24)),
                                        ))),
                                const Positioned(
                                    top: 0, left: 0, child: Icon(Icons.add)),
                              ])),
                        )
                      ],
                    )
                  : Container(),
              addToCart == true
                  ? GestureDetector(
                      onTap: () {
                        if (quantity > 0) {
                          cartProvider.add('$quantity');
                          Orders newOrder = Orders(
                              widget.product_name,
                              quantity,
                              double.parse(widget.price) * quantity,
                              widget.logo,
                              widget.public_id);
                          addItemToCart(newOrder);
                          print('added');
                        } else {
                          print("At least 1 item");
                        }
                      },
                      child: Container(
                        width: 100,
                        height: 30,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                            bottomLeft: Radius.circular(24),
                            bottomRight: Radius.circular(24),
                          ),
                        ),
                        child: itemsAddedToCart ? const Text(
                          'Update Cart',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              letterSpacing:
                              0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.4285714285714286),
                        ):const Text(
                          'Add to Cart',
                          style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'SF Pro Display',
                              fontSize: 14,
                              letterSpacing:
                                  0 /*percentages not used in flutter. defaulting to zero*/,
                              fontWeight: FontWeight.normal,
                              height: 1.4285714285714286),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
