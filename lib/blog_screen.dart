import 'package:blog/add_blog_screen.dart';
import 'package:blog/story_view.dart';
import 'package:flutter/material.dart';

import 'blog.dart';
import 'edit_blog_screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final String imageUrl =
      'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1965&q=80';
  final String name = 'Omar Hamada';

  List<Blog> blogs = [
    Blog(
        title: 'Piano',
        body:
            "a large keyboard musical instrument with a wooden case enclosing a soundboard and metal strings, which are struck by hammers when the keys are depressed. The strings' vibration is stopped by dampers when the keys are released and can be regulated for length and volume by two or three pedals.",
        imageUrl:
            'https://cdn1.img.sputnikarabic.ae/img/104012/71/1040127161_0:171:4032:2439_600x0_80_0_0_bf877107b21a7dab90c7ce76c503464d.jpg'),
    Blog(
        title: 'Titanic submarine',
        body:
            'Missing Titanic submarine LIVE: Can bodies be retrieved after implosion? Experts weigh in',
        imageUrl:
            "https://phantom-marca.unidadeditorial.es/e78616bbda77fe6fbc6b1ed5a05d3232/resize/828/f/webp/assets/multimedia/imagenes/2023/06/21/16873550466244.png"),
    Blog(
        title: 'Customized Cars',
        body:
            'Photo of two customized cars on a city side street. One car is raised up and the other is very low.',
        imageUrl:
            "https://burst.shopifycdn.com/photos/two-customized-cars-rolling-through-a-city-street.jpg?width=925&format=pjpg&exif=1&iptc=1"),
    Blog(
        title: 'Nature Tree Dawn',
        body: ".sdsdsin haob d sdk a dk sjd ",
        imageUrl:
            "https://cdn.pixabay.com/photo/2018/02/02/17/29/nature-3125912_1280.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Blog',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 24,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigaetToAddBlogScreen(),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => userItem(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) => blogItem(index),
            ),
          )
        ],
      ),
    );
  }

  Widget userItem() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoryViewScreen(),
            ));
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 38,
                  backgroundImage: NetworkImage(imageUrl),
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 12,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 10,
                )
              ],
            ),
            Text(
              name.length > 10 ? "${name.substring(0, 8)}..." : name,
              style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget blogItem(int index) {
    Blog blog = blogs[index];

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: Colors.grey[300]),
      margin: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              blog.imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    navigaetToEditBlogScreen(index);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.indigo,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              blog.body,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  navigaetToAddBlogScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewBlogScreen(),
        )).then((value) {
      Blog blog = value;
      blogs.add(blog);
      setState(() {});
    });
  }

  void navigaetToEditBlogScreen(int index) {
    final Blog blog = blogs[index];
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditBlogScreen(
            title: blog.title,
            body: blog.body,
            imageUrl: blog.imageUrl,
          ),
        )).then((value) {
      if (value == null) {
        return;
      }
      final Blog blog = value;
      blogs[index] = blog;
      setState(() {});
    });
  }
}
