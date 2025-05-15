import 'package:flutter/material.dart';
import '../models/MockupScreenOne.dart';
import '../screens/MockupScreenTwo.dart';

class MockupScreenOne extends StatefulWidget {
  const MockupScreenOne({super.key, required String title});

  @override
  MockupScreenOneState createState() => MockupScreenOneState();
}

class MockupScreenOneState extends State<MockupScreenOne> {
  String selectedCategory = 'Popular';

  


  static final List<Movie> movies = [
    Movie(
      title: 'To All the Boys: I Still Love You (2019)',
      year: '2019.',
      duration: '1h 48m',
      channel: 'Romance, Comedy',
      description: 'Lara Jean and Peter have just taken their romance from a lo..',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/en/b/bc/To_All_the_Boys_-_P.S._I_Still_Love_You_official_release_poster.jpg',
    ),
    Movie(
      title: 'Baby Driver',
      year: '2019',
      duration: '1h 53m',
      channel: 'Car Action, Crime, Drama',
      description: 'A hacker uncovers a simulated reality.',
      imageUrl: 'https://via.placeholder.com/150',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Purple header section
          Container(
            padding: const EdgeInsets.fromLTRB(16, 40, 16, 16),
            color: Colors.purple,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to MockupScreenTwo
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MockupScreenTwo(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('TMDB'),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const TextField(
                          enabled: false,
                          decoration: InputDecoration(
                            hintText: 'Find your movie',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sort / Filters',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Discover & Enjoy Your Favourite Movies',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Categories section
          Container(
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Popular', 'Upcoming', 'Now Playing'].map((category) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategory = category;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: selectedCategory == category ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: selectedCategory == category ? Colors.white : Colors.white70,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          // Movie list section
          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          movie.imageUrl,
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.error),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movie.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('${movie.year} • ${movie.duration}'),
                              Text('Channel: ${movie.channel}'),
                              Text(
                                movie.description,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}




