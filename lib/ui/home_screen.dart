import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hivve/assests/profile.dart';
import 'package:hivve/boxes/box.dart';
import 'package:hivve/models/notes_models.dart';
import 'package:hivve/ui/abc.dart';
import 'package:hivve/ui/uii.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String profileName = 'Ahmad';
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white60,
        elevation: 16.0,
        child: ListView(
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Colors.blue),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.to(Profile(profileName: profileName));
                      },
                      splashColor: Colors.red,
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/aabb.jpg'),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      profileName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                )),
            ListTile(
              splashColor: Colors.blue,
              title: const Text('Ahmad'),
              leading: const Icon(CupertinoIcons.person),
              onTap: () {},
            )
          ],
        ),
      ),
      appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Get.to(const Abc());
                },
                icon: const Icon(
                  CupertinoIcons.right_chevron,
                  color: Colors.white,
                )),
            IconButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
                Get.back();
              },
              color: Colors.white,
              tooltip: 'Dark Mode',
              splashColor: Colors.blue,
              icon: const Icon(
                Icons.dark_mode,
              ),
            ),
            IconButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
                Get.back();
              },
              color: Colors.white,
              tooltip: 'Light Mode',
              splashColor: Colors.blue,
              icon: const Icon(
                Icons.light_mode,
              ),
            ),
            IconButton(
                onPressed: () {
                  Get.to(const NewScreen());
                },
                icon: const Icon(CupertinoIcons.arrow_down_right))
          ],
          title: const Text(
            'Hive DB',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                backgroundColor: Colors.amber),
          ),
          backgroundColor: Colors.deepPurple),
      body: ValueListenableBuilder<Box<NotesModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NotesModel>();
            return ListView.builder(
                itemCount: box.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 7,
                    shadowColor: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                data[index].title.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Spacer(),
                              IconButton(
                                  splashColor: Colors.blue,
                                  onPressed: () {
                                    _editDialog(
                                        data[index],
                                        data[index].title.toString(),
                                        data[index].description.toString());
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.black,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    delete(data[index]);
                                  },
                                  splashColor: Colors.red,
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                          Text(
                            data[index].description.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        tooltip: 'Add New Notes',
        splashColor: Colors.blue,
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          _showMyDialog();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }

  Future<void> _editDialog(
      NotesModel notesModel, String title, String description) async {
    titleController.text = title;
    descriptionController.text = description;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Edit Notes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.center,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Edit Title',
                        suffix: Icon(Icons.title),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Edit Description',
                      suffix: Icon(Icons.description),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    selectionColor: Colors.red,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              TextButton(
                  onPressed: () {
                    notesModel.title = titleController.text.toString();
                    notesModel.description =
                        descriptionController.text.toString();
                    notesModel.save();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add Note',
                    selectionColor: Colors.blue,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
            ],
          );
        });
  }

  Future<void> _showMyDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text(
              'Add Notes',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.center,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Enter Title',
                        suffix: Icon(Icons.title),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10)))),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Enter Description',
                      suffix: Icon(Icons.description),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    selectionColor: Colors.red,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
              TextButton(
                  onPressed: () {
                    final data = NotesModel(
                        title: titleController.text,
                        description: descriptionController.text);
                    final box = Boxes.getData();
                    box.add(data);
                    data.save();
                    titleController.clear();
                    descriptionController.clear();
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Add Note',
                    selectionColor: Colors.blue,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  )),
            ],
          );
        });
  }
}
