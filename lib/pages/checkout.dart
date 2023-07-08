import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MyCheckoutCart extends StatefulWidget {
  const MyCheckoutCart({Key? key}) : super(key: key);

  @override
  State<MyCheckoutCart> createState() => _MyCheckoutCartState();
}

class _MyCheckoutCartState extends State<MyCheckoutCart> {
  String? delivery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: const Text('Your Cart'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Your Items',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.5555555555555556),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/restaurant_momo.png'),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
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
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(24, 24)),
                                              ))),
                                      const Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Icon(Icons.add)),
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/restaurant_momo.png'),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
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
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(24, 24)),
                                              ))),
                                      const Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Icon(Icons.add)),
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/restaurant_momo.png'),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
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
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(24, 24)),
                                              ))),
                                      const Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Icon(Icons.add)),
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/restaurant_momo.png'),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
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
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(24, 24)),
                                              ))),
                                      const Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Icon(Icons.add)),
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'lib/assets/images/restaurant_momo.png'),
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
                        const SizedBox(height: 15),
                        SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
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
                              const Text(
                                '1',
                                style: TextStyle(fontSize: 18),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {},
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
                                                color: Color.fromRGBO(
                                                    236, 219, 186, 1),
                                                borderRadius: BorderRadius.all(
                                                    Radius.elliptical(24, 24)),
                                              ))),
                                      const Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Icon(Icons.add)),
                                    ])),
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Total: 800',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 18,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.5555555555555556),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Delivery Details',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.5555555555555556),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    //  Delivery Address
                    DottedBorder(
                      borderType: BorderType.RRect,
                      color: Colors.orange,
                      radius: const Radius.circular(20),
                      child: ClipRRect(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Name:  Ashish Tamang'),
                              Text('Contact: 9845701618'),
                              Text('Naikap Tinthana Kathmandu')
                            ],
                          ),
                        ),
                      ),
                    ),


                  ],
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Payment',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.bold,
                      height: 1.5555555555555556),
                ),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Cash on delivery"),
                    Radio(
                      value: "cash",
                      groupValue: delivery,
                      onChanged: (value) {
                        setState(() {
                          delivery = value.toString();
                        });

                        showModalBottomSheet<void>(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          context: context,
                          elevation: 3,
                          builder: (context) {
                            return SizedBox(
                              height: 280,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  // Figma Flutter Generator PricesWidget - GROUP
                                  SizedBox(
                                      width: 343,
                                      height: 88,
                                      child: Stack(
                                          children: <Widget>[
                                            Positioned(
                                                top: 0,
                                                left: 0,
                                                child: Container(
                                                    width: 343,
                                                    height: 20,

                                                    child: Stack(
                                                        children: const <Widget>[
                                                          Positioned(
                                                              top: 0,
                                                              left: 0,
                                                              child: Text('Subtotal', textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 18,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.4285714285714286
                                                              ),)
                                                          ),

                                                          Positioned(
                                                              top: 0,
                                                              left: 280,
                                                              child: Text('Rs.150', textAlign: TextAlign.right, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 14,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.4285714285714286
                                                              ),)
                                                          ),
                                                        ]
                                                    )
                                                )
                                            ),


                                            Positioned(
                                                top: 32,
                                                left: 0,
                                                child: Container(
                                                    width: 343,
                                                    height: 20,

                                                    child: Stack(
                                                        children: const <Widget>[
                                                          Positioned(
                                                              top: 0,
                                                              left: 0,
                                                              child: Text('Delivery Fees', textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 18,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.4285714285714286
                                                              ),)
                                                          ),Positioned(
                                                              top: 0,
                                                              left: 280,
                                                              child: Text('Rs.50', textAlign: TextAlign.right, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 14,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.4285714285714286
                                                              ),)
                                                          ),
                                                        ]
                                                    )
                                                )
                                            ),

                                            Positioned(
                                                top: 64,
                                                left: 0,
                                                child: Container(
                                                    width: 343,
                                                    height: 24,
                                                    child: Stack(
                                                        children: const <Widget>[
                                                          Positioned(
                                                              top: 0,
                                                              left: 0,
                                                              child: Text('Total', textAlign: TextAlign.left, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 18,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.5
                                                              ),)
                                                          ),Positioned(
                                                              top: 0,
                                                              left: 280,
                                                              child: Text('Rs.200', textAlign: TextAlign.right, style: TextStyle(
                                                                  color: Color.fromRGBO(0, 0, 0, 1),
                                                                  fontFamily: 'SF Pro Display',
                                                                  fontSize: 16,
                                                                  letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                                                  fontWeight: FontWeight.normal,
                                                                  height: 1.5
                                                              ),)
                                                          ),
                                                        ]
                                                    )
                                                )
                                            ),
                                          ]
                                      )
                                  ),
                                  Container(
                                      width: 280,
                                      height: 48,
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                        borderRadius : BorderRadius.only(
                                          topLeft: Radius.circular(32),
                                          topRight: Radius.circular(32),
                                          bottomLeft: Radius.circular(32),
                                          bottomRight: Radius.circular(32),
                                        ),
                                        boxShadow : [BoxShadow(
                                            color: Color.fromRGBO(10, 20, 16, 0.20149999856948853),
                                            offset: Offset(8.531706009296642e-16,13.933333396911621),
                                            blurRadius: 27.866666793823242
                                        )],
                                        gradient : LinearGradient(
                                            begin: Alignment(6.123234262925839e-17,1),
                                            end: Alignment(-1,6.123234262925839e-17),
                                            colors: [Color.fromRGBO(57, 113, 89, 1),Color.fromRGBO(44, 88, 69, 1)]
                                        ),
                                      ),
                                      child: const Text('Place Order', textAlign: TextAlign.center, style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18,
                                          letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                                          fontWeight: FontWeight.normal,
                                          height: 1
                                      ),
                                      )),
                                ],
                              ),
                            );
                          },
                        );

                      },
                    ),
                  ],
                ),


                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Online Payment"),
                    Radio(
                      value: "online",
                      groupValue: delivery,
                      onChanged: (value) {
                        setState(() {
                          delivery = value.toString();
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text(
                  'No Payment method has been added yet. ',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color.fromRGBO(107, 107, 107, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      letterSpacing:
                      0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.3333333333333333),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      showModalBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                        ),
                        context: context,
                        elevation: 3,
                        builder: (context) {
                          return SizedBox(
                            height: 250,
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Payment',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 1),
                                          fontFamily: 'SF Pro Display',
                                          fontSize: 18,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                          height: 1.5555555555555556),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Cash on delivery"),
                                      Radio(
                                        value: "cash",
                                        groupValue: delivery,
                                        onChanged: (value) {
                                          setState(() {
                                            delivery = value.toString();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text("Online Payment"),
                                      Radio(
                                        value: "online",
                                        groupValue: delivery,
                                        onChanged: (value) {
                                          setState(() {
                                            delivery = value.toString();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Add Payment',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
