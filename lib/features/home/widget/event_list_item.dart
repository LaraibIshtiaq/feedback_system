import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/data/remote/models/event.dart';
import 'package:capp_mobile/features/custom/confirmation_popup.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/widget/release_feedback_icon.dart';
import 'package:capp_mobile/services/date_time_service.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget eventListItem(
    Event event,
    BuildContext context,
    HomeViewModel homeViewModel,
    WidgetRef ref){

  final GlobalKey<TooltipState> tooltipKey = GlobalKey<TooltipState>();
  bool showTooltip = ref.watch(homeViewModel.showToolTip);

  return Padding(
    padding: EdgeInsets.symmetric(vertical: dimensions.spacingSmaller),
    child: Container(
      padding: EdgeInsets.all(dimensions.spacingMedium),
      height: dimensions.itemHeightPrimary,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border(
          left: BorderSide(
              width: dimensions.borderSideSecondary,
              color: event.eventCategory.categoryColor),
        ),
        borderRadius: BorderRadius.circular(dimensions.cornerRadiusSecondary),
        boxShadow: [
          BoxShadow(
            color: colorBlack.withOpacity(0.06),
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: dimensions.spacingSmall),
                      child: CircleAvatar(
                        radius: 5,
                        backgroundColor: event.eventCategory.categoryColor,
                        child: CircleAvatar(
                          radius: 2,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Text(DateTimeService.formatToMonthDayYear(event.startDate),
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(event.eventName,
                    overflow: TextOverflow.clip,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                )
              ],
            ),
          ),

          Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      openBottomSheetToViewMoreOptions(context, event, homeViewModel, ref);
                    },
                    child: SizedBox(
                      width: dimensions.spacingMedium,
                      height: dimensions.spacingMedium,
                      child: SvgPicture.asset(
                          icViewMore,
                          color: Theme.of(context).colorScheme.onSurface
                      ),
                    ),
                  ),

                  if(event.feedbacks != null && event.eventCategory.categoryId == 3)
                    ReleaseFeedbackIcon(event: event)

                ],
              ),

              if (event.eventCategory.categoryId == 3 &&
                  showTooltip && event.endDate.isAfter(DateTime.now()))
                Positioned(
                  child: Container(
                    height: 60,
                    width: 200,
                    padding: EdgeInsets.symmetric(horizontal: 2, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).focusColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(tr("feedback_can_be_added_after_the_release_date"),
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ),
                ),
            ],
          )
        ],
      ),
    ),
  );
}

openBottomSheetToViewMoreOptions(
    BuildContext context,
    Event event,
    HomeViewModel homeViewModel,
    WidgetRef ref){
  showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
        return ListView(
          padding: EdgeInsets.symmetric(
              horizontal: dimensions.spacingMedium,
              vertical: 28),
          shrinkWrap: true,
          children: <Widget>[
            Text(event.eventName, style: Theme.of(context).textTheme.headlineSmall,),

            Text(DateTimeService.formatDateTime(
                event.startDate, DateTimeService.format1),
                style: Theme.of(context).textTheme.bodyMedium),

            Divider(
              thickness: 1,
              color: colorGreyFourthVariant,
            ),

            ListTile(
                leading: Icon(Icons.edit),
                title: Text(tr("edit_event")),
                onTap: () {
                  //Pop the bottom sheet of view more
                  context.maybePop();

                  homeViewModel.setValuesInTextField(event, ref);
                  context.pushRoute(AddEventRoute(event: event));
                }
            ),
            ListTile(
              leading: Icon(Icons.delete),
              title: Text(tr("delete")),
              onTap: () {
                ///Dismiss the bottom sheet
                Navigator.pop(context);

                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return ConfirmationPopup(
                      dialogTitle: tr("delete_event"),
                      dialogSubTitle: tr("are_you_sure_you_want_to_delete"),
                      confirmationText: tr("delete"),
                      onPressedCancel: () {
                        context.maybePop();
                      },
                      onPressedOk: () {
                        ///Proceed with deleting event
                        homeViewModel.deleteEvent(event.eventId??"", ref);
                        context.maybePop();
                      },
                    );
                  },
                );
              },
            ),
          ],
        );
      }
  );
}