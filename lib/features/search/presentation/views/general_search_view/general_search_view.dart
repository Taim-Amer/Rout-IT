import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:route_it27/core/utils/constants/app_colors.dart';
import 'package:route_it27/core/utils/router/app_router.dart';

class GeneralSearchView extends StatelessWidget {
  const GeneralSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Header
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Search',
                    style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Iconsax.search_normal,
                    color: AppColors.lightPrimaryColor,
                    size: 48,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // Search Bar
              TextField(
                controller: searchController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search for roadmaps,students etc..',
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: AppColors.lightPrimaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.search, color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
              const SizedBox(height: 20),
              // Search Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      FocusScope.of(context).unfocus();
                      GoRouter.of(context).push(AppRouter.kSearchResultView,
                          extra: searchController.text.trim());
                    }
                    // FocusScope.of(context).unfocus();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 14,
                    ),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Search Results
              Expanded(
                child: ListView.builder(
                  itemCount: 5, // Number of frameworks
                  itemBuilder: (context, index) {
                    // Data for each framework
                    final frameworks = [
                      {
                        'title': 'Flutter',
                        'website': 'https://flutter.dev',
                        'description':
                            'Flutter is an open-source UI software development toolkit created by Google. It is used to develop cross platform applications from a single codebase.'
                      },
                      {
                        'title': 'React',
                        'website': 'https://reactjs.org',
                        'description':
                            'React is a JavaScript library for building user interfaces. It allows developers to create large web applications that can update and render efficiently.'
                      },
                      {
                        'title': 'Vue.js',
                        'website': 'https://vuejs.org',
                        'description':
                            'Vue.js is a progressive JavaScript framework used for building user interfaces. It is designed to be incrementally adaptable and can also function as a web application framework.'
                      },
                      {
                        'title': 'Laravel',
                        'website': 'https://laravel.com',
                        'description':
                            'Laravel is a PHP web application framework with expressive, elegant syntax. It provides tools for routing, authentication, sessions, and caching, making web development easier and faster.'
                      },
                      {
                        'title': 'Django',
                        'website': 'https://www.djangoproject.com',
                        'description':
                            'Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design. It focuses on automating as much as possible and follows the "don\'t repeat yourself" principle.'
                      },
                    ];

                    final framework = frameworks[index];

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            framework['title']!,
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            framework['website']!,
                            style: const TextStyle(
                              color: Colors.tealAccent,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            framework['description']!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
