import 'package:flutter/material.dart';
import 'book.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const FirstPage(),
      },
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[700],
      appBar: AppBar(
        title: const Text('Book List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: <Widget>[
            BookCard(
              BookName: 'To Kill a Mockingbird',
              AuthorName: 'Harper Lee',
              Description : 'To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and was instantly successful.',
              Rate: 4,
              imageUrl: 'images/image1.jpg',
            ),
            BookCard(
              BookName: 'The Banks Sisters',
              AuthorName: 'Nikki Turner',
              Description: 'Kindle Edition. New York Times bestselling author Nikki Turner returns with her most spellbinding story to date: Meet the Banks sisters—Simone, Bunny, Tallhya, and Ginger.',
              Rate: 4.5,
              imageUrl: 'images/im1.jpg',
            ),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  final String BookName;
  final String AuthorName;
  final double Rate;
  final String imageUrl;
  final String Description;

  const BookCard({
    required this.BookName,
    required this.AuthorName,
    required this.Rate,
    required this.imageUrl,
    required this.Description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imageUrl,
                    width: 80,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        BookName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          fontFamily: 'To Kill a Mockingbird Book',
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(AuthorName),
                      SizedBox(height: 4.0),
                      Text(Description),
                      SizedBox(height: 4.0),
                      Text('Rating: $Rate'),
                      ElevatedButton.icon(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          Navigator.pushNamed(context,
                              '/Buy Now');
                        },
                        label: const Text('Buy '),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
