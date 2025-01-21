import 'package:capp_mobile/domain/providers/devices_repo_provider.dart';
import 'package:capp_mobile/domain/repositories/devices_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'devices_provider.dart';

final homeViewModel = Provider((ref) {
  final eventsNotifier = ref.read(eventProvider.notifier);
  final eventRepository = ref.watch(eventRepositoryProvider);
  return HomeViewModel(eventNotifier: eventsNotifier, eventRepository: eventRepository);
});


class HomeViewModel{
  final EventNotifier eventNotifier;
  final EventRepository eventRepository;

  HomeViewModel({required this.eventNotifier, required this.eventRepository});

  void getEvents() async {
    final devices = await eventRepository.getEvents();
    eventNotifier.replaceAllEvents(devices);
  }
}