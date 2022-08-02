import 'dart:async';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  void initState() {
    super.initState();
    testTimer();
  }

  var catBarTitles = [
    'Clothes',
    'Electronic',
    'HouseHold',
    'Appliances',
    'Others'
  ];
  var catBarIcons = [
    Icons.local_drink,
    Icons.bolt,
    Icons.house,
    Icons.bolt,
    Icons.double_arrow,
  ];
  var imgLst = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/backlitkeyboard.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg'
  ];
  var imgNameLst = [
    'Iphone 11 Pro',
    'Note 20 Ultra',
    'Backlit',
    'Macbook Air',
    'Macbook Pro',
    'Gaming Pc'
  ];
  int counter = 0;
  var lstColor = [Colors.black, Colors.purple];
  int item0 = 1, item1 = 0, item2 = 0, item3 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ecom App UI',
          style:  TextStyle(color: Colors.black),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(
              Icons.notifications,
              color: Colors.black,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: const Icon(
            Icons.search,
            size: 40,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 45,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    item0 = 1;
                    item1 = 0;
                    item2 = 0;
                    item3 = 0;
                  });
                },
                icon: const Icon(Icons.home),
                iconSize: 30,
                color: lstColor[item0],
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    item0 = 0;
                    item1 = 1;
                    item2 = 0;
                    item3 = 0;
                  });
                },
                icon: const Icon(Icons.favorite),
                iconSize: 30,
                color: lstColor[item1],
                padding: const EdgeInsets.only(right: 18.0),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    item0 = 0;
                    item1 = 0;
                    item2 = 1;
                    item3 = 0;
                  });
                },
                icon: const Icon(Icons.add_shopping_cart),
                iconSize: 30,
                color: lstColor[item2],
                padding: const EdgeInsets.only(left: 18.0),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    item0 = 0;
                    item1 = 0;
                    item2 = 0;
                    item3 = 1;
                  });
                },
                icon: const Icon(Icons.person),
                iconSize: 30,
                color: lstColor[item3],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Row(
                  children: [
                    Container(
                      child: const Text(
                        'Items',
                        style:  TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      width: 138,
                    ),
                    const Text(
                      'View More',
                      style:  TextStyle(color: Colors.purple, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                child: bigCotainer(counter),
              ),
              const ListTile(
                title: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    'More Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catBarTitles.length,
                    itemBuilder: (context, int index) {
                      return catBar(index);
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(children: [
                Container(
                  margin: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: const Text(
                    'Popular Items',
                    style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  width: 95,
                ),
                const Text(
                  'View More',
                  style:  TextStyle(color: Colors.purple, fontSize: 13),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 12.0,
                      crossAxisCount: 2,
                      mainAxisSpacing: 10),
                  shrinkWrap: true,
                  itemCount: imgLst.length,
                  itemBuilder: (context, int index) {
                    return smallContainer(index);
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget smallContainer(int index) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 3,
                spreadRadius: 2)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 75,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(imgLst[index]),
              fit: BoxFit.fill,
            )),
          ),
          ListTile(
            title: Text(
              imgNameLst[index],
              style:
                  const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(
              children: [star(), star(), star(), star(), star(), const Text(' 5.0',style: TextStyle(fontSize: 13),)],
            ),
          )
        ],
      ),
    );
  }

  Widget bigCotainer(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 3,
                blurRadius: 3)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(imgLst[index]), fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: Text(
                imgNameLst[index],
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Row(
                children: [
                  star(),
                  star(),
                  star(),
                  star(),
                  star(),
                  const Text(
                    ' 5.0 (23 Reviews)',
                    style:  TextStyle(color: Colors.black, fontSize: 13),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget catBar(int index) {
    return Container(
      height: 60,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(55),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 2,
              color: Colors.grey.withOpacity(0.8))
        ],
      ),
      child: ListTile(
        tileColor: Colors.white,
        leading: Icon(
          catBarIcons[index],
          color: Colors.purple,
        ),
        title: Text(
          catBarTitles[index],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text('5 Items'),
      ),
    );
  }

  Widget star() {
    return const Icon(
      Icons.star,
      color: Colors.amber,
      size: 12,
    );
  }

  void testTimer() {
    Timer(const Duration(seconds: 3), () {
      setState(() {
        if (counter < imgLst.length - 1) {
          if (counter != imgLst.length) {
            counter++;
          }
          testTimer();
        } else {
          counter = 0;
          testTimer();
        }
      });
    });
  }
}
