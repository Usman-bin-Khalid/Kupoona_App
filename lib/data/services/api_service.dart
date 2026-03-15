import '../models/event_model.dart';

class ApiService {
  Future<List<EventModel>> fetchEvents() async {
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    return [
      EventModel(
        id: '1',
        title: 'Sample Event',
        description: 'This is a sample event',
      ),
    ];
  }
}
