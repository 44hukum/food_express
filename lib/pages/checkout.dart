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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 450,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    const Text(
                      'Your Items',
                      textAlign: TextAlign.left,
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: Color.fromRGBO(
                                                        236, 219, 186, 1),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.elliptical(
                                                                24, 24)),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  const Text('No Payment method has been added yet. ', textAlign: TextAlign.left, style: TextStyle(
                      color: Color.fromRGBO(107, 107, 107, 1),
                      fontFamily: 'SF Pro Display',
                      fontSize: 12,
                      letterSpacing: 0 /*percentages not used in flutter. defaulting to zero*/,
                      fontWeight: FontWeight.normal,
                      height: 1.3333333333333333
                  ),),
                  const SizedBox(height: 10),
                  GestureDetector(onTap: (){
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
                          height: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Payment and Checkout Overlay'),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },child: const Text('Add Payment Method'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
