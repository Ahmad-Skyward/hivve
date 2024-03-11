import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, required this.profileName});

 final String profileName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          const Center(
            child: CircleAvatar(
              radius: 200,
              backgroundImage: AssetImage('assets/aabb.jpg'),
            ),
          ),
          Text(
            profileName,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(onPressed: (){

          }, child: const Text('Profile'))
        ],
      ),
    );
  }
}
