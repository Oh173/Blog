import 'package:blog/blog.dart';
import 'package:flutter/material.dart';

class AddNewBlogScreen extends StatelessWidget {
  AddNewBlogScreen({Key? key}) : super(key: key);

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Blog",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Title',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: bodyController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'Body',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: imageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              hintText: 'ImageUrl',
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = titleController.text;
          String body = bodyController.text;
          String imageUrl = imageController.text.isEmpty
              ? "https://media.istockphoto.com/id/1273391783/photo/group-of-friends-hiking-in-nature.jpg?s=1024x1024&w=is&k=20&c=vySP01Qf1jHfLUOhQKsu3QYVpdJCMroL5uw8k3EeKlE="
              : imageController.text;

          Blog blog = Blog(title: title, body: body, imageUrl: imageUrl);

          Navigator.pop(context, blog);
        },
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
