import 'package:breeze/src/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends ConsumerWidget {
  SearchScreen({super.key});

  final TextEditingController searchTerm = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          'Search Weather',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchTerm,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: 'Enter city name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    searchTerm.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String searchQuery = searchTerm.text;
              context.goNamed(RoutePaths.searchHomeScreenRoute,
                  extra: searchQuery);
            },
            child: const Text('Search'),
          ),
        ],
      ),
    );
  }
}
