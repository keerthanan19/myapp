import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final Map<String, dynamic> menu;

  const CategoryScreen({Key? key, required this.menu, required String menuId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu['title']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              menu['title'],
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Available: ${menu['available_time']['days']}, '
              '${menu['available_time']['start']} - ${menu['available_time']['end']}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
