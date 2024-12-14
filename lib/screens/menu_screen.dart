import 'package:flutter/material.dart';
import 'package:myapp/providers/data_provider.dart';
import 'package:myapp/providers/menu_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // The MenuProvider class
import 'category_screen.dart'; // Navigate to this screen

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: FutureBuilder(
        future: DataProvider().fetchMenus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error fetching data'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No menu items available.'));
          }

          // Set menus in the provider
          Provider.of<MenuProvider>(context, listen: false)
              .setMenus(snapshot.data ?? []);

          return Consumer<MenuProvider>(
            builder: (context, menuProvider, child) {
              return ListView.builder(
                itemCount: menuProvider.menus.length,
                itemBuilder: (context, index) {
                  var menu = menuProvider.menus[index];
                  var title = menu['Title']['en'];
                  var availability = menu['MenuAvailability'];
                  var availableTime = _formatAvailableTime(availability);

                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      title: Text(
                        title,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        'Available: $availableTime',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      onTap: () {
                        // Navigate to the CategoryScreen and pass the menu data
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryScreen(
                              menu: menu,
                              menuId: '',
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  String _formatAvailableTime(Map<String, dynamic> availability) {
    var days = availability.keys.join(' - ');
    var startTime = availability['Sunday']['StartTime'];
    var endTime = availability['Sunday']['EndTime'];

    var formattedStartTime = _formatTime(startTime);
    var formattedEndTime = _formatTime(endTime);

    return '$days, $formattedStartTime - $formattedEndTime';
  }

  String _formatTime(String time) {
    final DateFormat formatter = DateFormat('HH:mm');
    final parsedTime = DateTime.parse('2020-01-01 $time:00');
    return formatter.format(parsedTime);
  }
}
