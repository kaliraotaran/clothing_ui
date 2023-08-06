import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 6,
        width: isActive ? 50 : 10,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: isActive ? Colors.black : Colors.grey.shade500,
            borderRadius: BorderRadius.circular(5)));
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Collection',
                        style: TextStyle(
                            fontSize: 25, color: Colors.grey.shade500),
                      ),
                      Text(
                        'Winter 2021',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: _buildIndicator(),
                      ),
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.black,
                        minWidth: 50,
                        height: 50,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.65,
              width: MediaQuery.of(context).size.width,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                controller: _controller,
                children: [
                  Image.asset('images/ex1.jpeg'),
                  Image.asset('images/ex2.jpeg'),
                  Image.asset('images/ex3.jpeg'),
                  Image.asset('images/ex4.jpeg'),
                  Image.asset('images/ex5.jpeg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
