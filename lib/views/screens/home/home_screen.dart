import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/home_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kuponna Home')),
      body: Consumer<HomeProvider>(
        builder: (context, homeProvider, child) {
          if (homeProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (homeProvider.events.isEmpty) {
            return Center(
              child: ElevatedButton(
                onPressed: () => homeProvider.loadEvents(),
                child: const Text('Load Events'),
              ),
            );
          }

          return ListView.builder(
            itemCount: homeProvider.events.length,
            itemBuilder: (context, index) {
              final event = homeProvider.events[index];
              return ListTile(
                title: Text(event.title),
                subtitle: Text(event.description),
              );
            },
          );
        },
      ),
    );
  }
}
