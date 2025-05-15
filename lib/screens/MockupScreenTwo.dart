import 'package:app/models/MockupScreenOne.dart';
import 'package:flutter/material.dart';

class MockupScreenTwo extends StatelessWidget {
  const MockupScreenTwo({super.key});

  // Sample movie data
  static final List<Movie> movies = [
    Movie(
      title: 'Jumanji: Welcome to the Jungle',
      year: '2017',
      duration: '1h 59m',
      channel: 'Starz',
      description: 'Teens get sucked into a magical video game.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
    Movie(
      title: 'Jumanji: The Next Level',
      year: '2019',
      duration: '2h 3m',
      channel: 'Hulu',
      description: 'The gang returns to Jumanji to rescue a friend.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header banner with TMDB and JUMANJI
            Stack(
              children: [
                Image.network(
                  'https://via.placeholder.com/400x200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 200,
                    color: Colors.grey,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    color: Colors.blue,
                    child: const Text(
                      'TMDB',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 16,
                  left: 16,
                  child: Text(
                    'JUMANJI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            // What's Popular section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What's Popular",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                movie.imageUrl,
                                height: 150,
                                width: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                              ),
                              Text(
                                movie.title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${movie.year} • ${movie.duration}'),
                              Text('Channel: ${movie.channel}'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Now Playing section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Now Playing',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: movies.length,
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return Container(
                          width: 200,
                          margin: const EdgeInsets.only(right: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                movie.imageUrl,
                                height: 150,
                                width: 200,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                              ),
                              Text(
                                movie.title,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text('${movie.year} • ${movie.duration}'),
                              Text('Channel: ${movie.channel}'),
                            ],
                          ),
                        );
                      },
                    ),
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