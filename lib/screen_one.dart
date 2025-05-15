import 'package:flutter/material.dart';

class Mockupscreenone extends StatefulWidget {
  const Mockupscreenone({Key? key}) : super(key: key);

  @override
  State<Mockupscreenone> createState() => _MockupscreenoneState();
}

class _MockupscreenoneState extends State<Mockupscreenone> {
  int _selectedTabIndex = 0;
  final List<String> _tabs = ['Popular', 'Upcoming', 'Now Playing'];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF51516A),
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFF01B4A7),
                  borderRadius: BorderRadius.circular(3),
                ),
                // this is my header section
                child: const Text(
                  'TMDB',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey.shade300, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      'Find your movies...',
                      style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Text(
                'Sort | Filters',
                style: TextStyle(color: Colors.grey.shade300, fontSize: 12),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            color: const Color(0xFF51516A),
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Padding(
                  padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
                  child: Text(
                    'Discover & Enjoy\nYour Favourite Movies',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                
                // These are my genres 
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(
                      _tabs.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            color: _selectedTabIndex == index ? const Color(0xFF01B4A7) : Colors.transparent,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            _tabs[index],
                            style: TextStyle(
                              color: _selectedTabIndex == index ? Colors.white : Colors.grey.shade300,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // these are my lists of movies with their title,durations,genres and description
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              children: const [
                MovieListItem(
                  imageUrl: 'assets/images/theboys.jpg',
                  title: 'To All the Boys: P.S. I Still Love You',
                  year: '2019',
                  duration: '1h 45m',
                  genres: 'Romance, Comedy',
                  description: 'Lara Jean and Peter have just taken their romance from a...',
                ),
                SizedBox(height: 10),
                MovieListItem(
                  imageUrl: 'assets/images/babydriver.jpg',
                  title: 'Baby Driver',
                  year: '2017',
                  duration: '1h 53m',
                  genres: 'Action, Crime, Drama',
                  description: 'After being coerced into working for a crime boss, a yo...',
                ),
                SizedBox(height: 10),
                MovieListItem(
                  imageUrl: 'assets/images/johnwick.jpg',
                  title: 'John Wick',
                  year: '2019',
                  duration: '2h 10m',
                  genres: 'Action, Crime, Thriller',
                  description: 'John Wick is on the run after killing a member of the intern...',
                ),
                SizedBox(height: 10),
                MovieListItem(
                  imageUrl: 'assets/images/exit.jpg',
                  title: 'Exit',
                  year: '2019',
                  duration: '1h 39m',
                  genres: 'Action, Comedy, Drama',
                  description: '',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF01B4A7),
        unselectedItemColor: Colors.grey,
        currentIndex: 1, 
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
      );
  }
}

class MovieListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;
  final String duration;
  final String genres;
  final String description;

  const MovieListItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.year,
    required this.duration,
    required this.genres,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
            ),
            child: Image.asset(
              imageUrl,
              width: 60,
              height: 88,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 60,
                  height: 88,
                  color: Colors.grey.shade300,
                  child: const Icon(Icons.movie, color: Colors.grey),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 5, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '$year • $duration',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
                  ),
                  Text(
                    genres,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 10),
                  ),
                  if (description.isNotEmpty)
                    Text(
                      description,
                      style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}