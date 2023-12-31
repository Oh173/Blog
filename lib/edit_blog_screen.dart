import 'package:blog/blog.dart';
import 'package:flutter/material.dart';

class EditBlogScreen extends StatefulWidget {
  const EditBlogScreen({
    Key? key,
    required this.title,
    required this.body,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String body;
  final String imageUrl;

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final ediTitleController = TextEditingController();

  final editBodyController = TextEditingController();

  final editImageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    ediTitleController.text = widget.title;
    editBodyController.text = widget.body;
    editImageController.text = widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Blog",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            controller: ediTitleController,
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
            controller: editBodyController,
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
            controller: editImageController,
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
          String title = ediTitleController.text;
          String body = editBodyController.text;
          String imageUrl = editImageController.text.isEmpty
              ? "https://media.istockphoto.com/id/1273391783/photo/group-of-friends-hiking-in-nature.jpg?s=1024x1024&w=is&k=20&c=vySP01Qf1jHfLUOhQKsu3QYVpdJCMroL5uw8k3EeKlE="
              : editImageController.text;

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
