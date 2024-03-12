import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hivve/ui/home_screen.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 450,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/aabb.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
                height: 300,
                child: Stack(
                  children: [
                    Positioned(
                      top: 40,
                      right: 30,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        width: 40,
                        height: 40,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 30,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.black12,
                ),
                height: 300,
                child: Stack(
                  children: [
                    const Positioned(
                      left: 15,
                      top: 10,
                      child: Text(
                        'Mountains',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 70,
                      top: 15,
                      child: Text(
                        '\$49',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 15,
                      top: 35,
                      child: Text(
                        '/person',
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 5,
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.location_on,
                          color: Colors.lightBlue,
                        ),
                        label: const Text(
                          'Pakistan, KPK',
                          style: TextStyle(
                            color: Colors.lightBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 70,
                      left: 15,
                      right: 10,
                      child: Text(
                        'Feel free to adjust the properties within the'
                        '\n BoxDecoration to customize the appearance of'
                        '\n your container based on your design preferences.',
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Positioned(
                      top: 150,
                      left: 20,
                      child: Text(
                        'Preview',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 20,
                      top: 140,
                      child: TextButton.icon(
                        onPressed: () {},
                        label: const Text(
                          '4.5',
                          style: TextStyle(fontSize: 18),
                        ),
                        icon: const Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.yellow,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      images[index],
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            InkWell(
                onTap: () {
                  Get.to(const HomeScreen());
                },
                child: Container(
                  width: 330,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: const Center(
                      child: Text(
                    'Book Now',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                ))
          ],
        ),
      ),
    );
  }
}
