import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final List<String> images = [
    'assets/images/aabb.jpg',
    'assets/images/asas.jpg',
    'assets/images/ccc.png',
    'assets/images/cxz.jpg',
    'assets/images/ddd.jpg',
    'assets/images/dsds.jpg',
    'assets/images/ese.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/aabb.jpg'),
          )
        ],
        centerTitle: true,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu));
        }),
        title: const Text(
          'Current Location\n Home Screen',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: const Drawer(
          child: DrawerHeader(
        child: Column(
          children: [],
        ),
      )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Category',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        TextButton.icon(
                            label: const Text('View all',
                                style: TextStyle(
                                  color: Colors.lightBlue,
                                )),
                            icon: const Icon(
                              CupertinoIcons.arrow_right,
                              color: Colors.lightBlue,
                            ),
                            onPressed: () {}),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.car_rental_outlined),
                      label: const Text(
                        'Mountains',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.watch),
                      label: const Text(
                        'WaterFall',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.sports_baseball),
                      label: const Text(
                        'Rivers',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.park),
                      label: const Text(
                        'Parks',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      )),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.laptop_chromebook),
                      label: const Text(
                        'Adventures',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20),
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 230,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(10),
                  itemCount: images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            images[index],
                            width: 350,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                            left: 17,
                            bottom: 30,
                            child: TextButton(
                              child: const Text(
                                'Mountains',
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {},
                            )),
                        Positioned(
                            left: 10,
                            child: IconButton(
                              icon: const Icon(
                                CupertinoIcons.location_solid,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            )),
                        const Positioned(
                            left: 60,
                            bottom: 10,
                            child: Text('Pakistan',
                                style: TextStyle(color: Colors.white))),
                        const Positioned(
                            right: 30,
                            bottom: 30,
                            child: Text(
                              '\$20',
                              style: TextStyle(color: Colors.white),
                            )),
                        const Positioned(
                            right: 30,
                            bottom: 10,
                            child: Text(
                              '/Person',
                              style: TextStyle(color: Colors.white),
                            )),
                      ],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Popular Destination',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        TextButton.icon(
                            label: const Text(
                              'View all',
                              style: TextStyle(color: Colors.lightBlue,),
                            ),
                            icon: const Icon(CupertinoIcons.arrow_right,
                                color: Colors.lightBlue),
                            onPressed: () {}),
                      ],
                    )),
              ],
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      SizedBox(
                        width: 325,
                        height: 160,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(
                                images[index],
                                width: 100,
                                height: 100,
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Positioned(
                        left: 130,
                        top: 25,
                        child: Text(
                          'The Pink Beach',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        top: 45,
                        left: 115,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                CupertinoIcons.location_solid,
                                color: Colors.blue,
                              ),
                              onPressed: () {},
                            ),
                            const Text(
                              '"Pakistan" ,KPK',
                              style: TextStyle(color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                      const Positioned(
                          bottom: 40,
                          left: 130,
                          child: Text(
                              'This the simple ui for the travel\n app for the travel app')),
                      const Positioned(
                          bottom: 10,
                          left: 130,
                          child: Row(
                            children: [
                              Text(
                                '\$49',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Text('/ Person'),
                            ],
                          ))
                    ],
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              tooltip: 'Home', icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              tooltip: 'Favorite',
              icon: Icon(Icons.favorite),
              label: 'Favorite'),
          BottomNavigationBarItem(
              tooltip: 'Cart',
              icon: Icon(Icons.add_shopping_cart),
              label: 'Cart'),
          BottomNavigationBarItem(
              tooltip: 'Profile', icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        showSelectedLabels: true,
        backgroundColor: Colors.white60,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
