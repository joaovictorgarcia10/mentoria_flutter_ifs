import 'package:flutter/material.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
      child: SizedBox(
        height: 350.0,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/img1.jpg"),
                  ),
                  SizedBox(width: 10.0),
                  Text("Nome do Usuário")
                ],
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
              child: Container(
                // height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/post.jpg"),
                  fit: BoxFit.cover,
                )),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.comment_outlined),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
