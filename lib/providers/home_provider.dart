import 'package:flutter/material.dart';
import '../data/models/event_model.dart';
import '../data/services/api_service.dart';

class HomeProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<EventModel> _events = [];
  bool _isLoading = false;

  List<EventModel> get events => _events;
  bool get isLoading => _isLoading;

  Future<void> loadEvents() async {
    _isLoading = true;
    notifyListeners();

    try {
      _events = await _apiService.fetchEvents();
    } catch (e) {
      // Handle error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
