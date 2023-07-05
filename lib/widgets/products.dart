import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  bool addToCart = false;
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('lib/assets/images/restaurant_momo.png'),
                        fit: BoxFit.cover),
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Text(
                        'Chicken Momos',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5),
                      ),
                      SizedBox(
                        width: 70,
                      ),
                      Text(
                        'Rs. 200',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'SF Pro Display',
                            fontSize: 20,
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1.5),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 300,
                    child: Text(
                      'Indulge in the delectable flavors of our Chicken Momos, a popular dish from the Himalayan region. These mouthwatering dumplings feature a succulent filling of finely minced chicken, mixed with aromatic spices and herbs.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
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
                              quantity > 1
                                  ? quantity = quantity - 1
                                  : quantity = 1;
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
                  ? Container(
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
                      child: const Text(
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
