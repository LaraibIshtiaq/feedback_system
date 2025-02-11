import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/features/home/provider/event_provider.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/widget/event_list_item.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventList extends ConsumerWidget {
  late List<Event> eventsList;

  EventList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    eventsList = ref.watch(eventProvider);
    final homeViewModel = ref.read(homeViewModelProvider);

    return eventsList.isNotEmpty ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: dimensions.spacingMedium),
            child: Text("${tr("events")}: ${homeViewModel.getMonthName()}",
              style: Theme.of(context).textTheme.bodyMedium,),
          ),

          ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
              horizontal: dimensions.spacingMedium,
              vertical: dimensions.spacingNormal),
          itemCount: eventsList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index){
            final event = eventsList[index];
            return eventListItem(event, context, homeViewModel, ref);
            },
          ),
        ],
      )
        :
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.bottomCenter,
          child: Text(tr("no_events_found"),
          style: Theme.of(context).textTheme.bodyLarge)
      ),
    );
  }
}