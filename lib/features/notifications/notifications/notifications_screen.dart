import 'package:auto_route/annotations.dart';
import 'package:capp_mobile/data/remote/models/received_notifications.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/notifications/provider/contact_us_view_model.dart';
import 'package:capp_mobile/features/notifications/provider/notification_provider.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:collection/collection.dart';

@RoutePage()
class NotificationsScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsViewModel = ref.read(contactUsViewModelProvider);
    final notificationsList = ref.watch(notificationProvider);

    // Group notifications by date
    final groupedNotifications = groupBy(notificationsList, (notification) {
      return DateFormat('MMMM d, yyyy').format(notification.createdAt);
    });

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
        context: context,
        title: tr("notifications"),
        scaffoldKey: _scaffoldKey,
        onPressedBackButton: () {
          Navigator.pop(context);
        },
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.spacingSmall,
          vertical: dimensions.spacingMedium,
        ),
        itemCount: groupedNotifications.keys.length,
        itemBuilder: (context, index) {
          String date = groupedNotifications.keys.elementAt(index);
          List notifications = groupedNotifications[date]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Header
              Padding(
                padding: EdgeInsets.symmetric(vertical: dimensions.spacingSmall),
                child: Text(
                  date,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorTextSecondaryLight,
                  ),
                ),
              ),
              ...notifications.map((notification) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: dimensions.spacingMedium),
                      child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Theme.of(context).primaryColor),
                    ),
                    Expanded(child: NotificationTile(notification)),
                  ],
                );
              }),
            ],
          );
        },
      ),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final dynamic notification;

  const NotificationTile(this.notification, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ///Open bottom sheet to let user view the message detail
        openBottomSheetToViewMessage(
            context,
            notification
        );

        ///send api for mark as read
      },
      child: Container(
        margin: EdgeInsets.only(
            bottom: dimensions.spacingSmall,
            left: dimensions.spacingSmall,
            right: dimensions.spacingSmall
        ),
        padding: EdgeInsets.all(dimensions.spacingMedium),
        decoration: BoxDecoration(
          color: notification.isRead ? Colors.white : Theme
              .of(context)
              .focusColor,
          borderRadius: BorderRadius.circular(dimensions.cornerRadiusPrimary),
        ),
        child: Row(
          children: [
            SizedBox(
              height: 52,
              width: 55,
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: colorBlack,
                    radius: dimensions.iconSizePrimary,
                    child: Image.asset(
                        imageProfile), // User profile placeholder
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: colorBlack,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: Image.asset(logoTeo), // Company logo placeholder
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: dimensions.spacingSmall),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Laraib Ishtiaq" /*notification.senderName*/,
                    maxLines: 1,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyLarge,
                  ),
                  Text(
                    notification.content,
                    maxLines: 2,
                    style: Theme
                        .of(context)
                        .textTheme
                        .labelSmall,
                  ),
                ],
              ),
            ),
            SizedBox(width: dimensions.spacingSmall),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  DateFormat('hh:mm a').format(notification.createdAt),
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                Text("")
              ],
            ),
          ],
        ),
      ),
    );
  }


  openBottomSheetToViewMessage(BuildContext context,
      ReceivedNotifications receivedNotification) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return ListView(
            padding: EdgeInsets.symmetric(
                horizontal: dimensions.spacingMedium,
                vertical: dimensions.spacingExtraLarge),
            shrinkWrap: true,
            children: <Widget>[
              Text(tr("you_got_a_message_by"),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: colorTextSecondaryLight),),
              Padding(
                padding: EdgeInsets.only(bottom: dimensions.spacingExtraLarge),
                child: Text("Laraib Ishtiaq"/*receivedNotification.senderName*/,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,),
              ),

              Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).focusColor,
                        borderRadius: BorderRadius.circular(
                            dimensions.cornerRadiusPrimary),
                      ),
                    ),

                    Positioned(
                      bottom: -10,
                      right: MediaQuery.of(context).size.width * 0.4,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            backgroundColor: colorBlack,
                            radius: 30,
                            child: Image.asset(
                                imageProfile), // User profile placeholder
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: colorBlack,
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                              ),
                              child: Image.asset(logoTeo), // Company logo placeholder
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(vertical: dimensions.spacingExtraLarge),
                child: Text(receivedNotification.content,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge,),
              ),
            ],
          );
        }
    );
  }
}