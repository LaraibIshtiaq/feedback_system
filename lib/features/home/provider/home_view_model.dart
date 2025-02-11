import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/domain/model/ui_dto/project.dart';
import 'package:capp_mobile/domain/providers/event_repo_provider.dart';
import 'package:capp_mobile/domain/providers/project_repo_provider.dart';
import 'package:capp_mobile/domain/repositories/event_repository.dart';
import 'package:capp_mobile/domain/repositories/project_repository.dart';
import 'package:capp_mobile/features/home/provider/project_provider.dart';
import 'package:capp_mobile/features/home/provider/selected_date_provider.dart';
import 'package:capp_mobile/features/home/provider/streak_date_provider.dart';
import 'package:capp_mobile/shared/constants/constants.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'event_provider.dart';

final homeViewModelProvider = Provider((ref) {
  final eventsNotifier = ref.read(eventProvider.notifier);
  final eventRepository = ref.watch(eventRepositoryProvider);

  final projectsNotifier = ref.read(projectProvider.notifier);
  final projectRepository = ref.watch(projectRepositoryProvider);

  final streakDateNotifier = ref.read(streakDateProvider.notifier);
  final selectedDateNotifier = ref.read(selectedDateProvider.notifier);
  return HomeViewModel(
      eventNotifier: eventsNotifier,
      eventRepository: eventRepository,
      projectNotifier: projectsNotifier,
      projectRepository: projectRepository,
      streakDateNotifier: streakDateNotifier,
      selectedDateNotifier: selectedDateNotifier,
      ref: ref);
});


class HomeViewModel{
  final EventNotifier eventNotifier;
  final EventRepository eventRepository;
  final ProjectNotifier projectNotifier;
  final ProjectRepository projectRepository;
  final StreakDateNotifier streakDateNotifier;
  final SelectedDateNotifier selectedDateNotifier;
  ProviderRef ref;
  List<Project> projectsList = [];
  List<Categories> categoriesList = [];

  HomeViewModel({
    required this.eventNotifier,
    required this.eventRepository,
    required this.projectNotifier,
    required this.projectRepository,
    required this.streakDateNotifier,
    required this.selectedDateNotifier,
  required this.ref}){

    ///So we have categories list, events, projects all in advance
    getCategoriesList();
    getEvents();
    getProjects();
  }

  TextEditingController eventNameController = TextEditingController(text: "");
  TextEditingController eventNoteController = TextEditingController(text: "");

  ///Used in selecting categories of event
  final StateProvider<String> selectedCategory = StateProvider<String>((ref) => Categories.values.first.stringValue);
  ///Used to listen to changes of start date of event
  final StateProvider<DateTime> startDate = StateProvider<DateTime>((ref) => DateTime.now());
  ///Used to listen to changes of end date of event
  final StateProvider<DateTime> endDate = StateProvider<DateTime>((ref) => DateTime.now());
  ///Used to listen to changes of selected page from Navigation Drawer
  final StateProvider<int> selectedDrawer = StateProvider<int>((ref) => 0);
  ///Used to listen to changes of selected month on calendar
  final StateProvider<int> selectedMonth = StateProvider<int>((ref) => DateTime.now().month);

  ///Used to determine whether user is yet allowed to add release feedback
  StateProvider<bool> showToolTip = StateProvider<bool>((ref) => false);

  ///Used to analyze whether all conditions are met for save/update
  StateProvider<bool> enableAddEvent = StateProvider<bool>((ref) => false);

  String getMonthName() {
    return DateFormat.MMMM().format(DateTime(0, ref.read(selectedMonth)));
  }

  getEvents() async {
    List<Event> events = await eventRepository.getEvents(projectId, ref.read(selectedMonth));
    eventNotifier.removeAllEvents();
    streakDateNotifier.removeStreakedDates();
    if(events.isNotEmpty){
      eventNotifier.replaceAllEvents(events);
      streakDateNotifier.addDatesInList(events);
    }
  }

  addEvent(Event event) async {
    dynamic result = await eventRepository.addEvent(event.toJson(event));
    if(result != null){
      getEvents();
    }
  }

  setValuesInTextField(Event event, WidgetRef ref) {
    eventNameController.text = event.eventName;
    eventNoteController.text = event.eventNote;
    ref.read(selectedCategory.notifier)
        .state = event.eventCategory.categoryName;
    ref.read(startDate.notifier).state = event.startDate;
    ref.read(endDate.notifier).state = event.endDate;
  }

  restoreValuesInTextField(WidgetRef ref) {
    eventNameController.text = "";
    eventNoteController.text = "";
    ref.read(selectedCategory.notifier)
        .state = Categories.values.first.name;
    ref.read(startDate.notifier).state = DateTime.now();
    ref.read(endDate.notifier).state = DateTime.now();
  }

  getProjects() async {
    projectsList = await projectRepository.getProjects();
    projectNotifier.replaceAllProject(projectsList);
  }

  getCategoriesList() async {
    categoriesList = Categories.values;
  }

  changeSelectedDate(DateTime newDate){
    selectedDateNotifier.changeSelectedDate(newDate);
  }

  deleteEvent(String eventId, WidgetRef ref) async {
    dynamic result = await eventRepository.deleteEvent(eventId);
    if(result != null){
      eventNotifier.removeEvent(eventId);
      streakDateNotifier.removeStreakedDates();
      getEvents();
      return true;
    }
    else{
      return false;
    }
  }

  updateEvent(Event event) async {
    dynamic result = await eventRepository.updateEvent(event.eventId!, event.toJson(event));
    if(result != null){
      eventNotifier.removeEvent(event.eventId!);
      streakDateNotifier.removeStreakedDates();
      getEvents();
      return true;
    }
    else{
      return false;
    }
  }
}