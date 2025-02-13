import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/custom/custom_app_drawer.dart';
import 'package:capp_mobile/features/custom/primary_dropdown.dart';
import 'package:capp_mobile/features/home/provider/project_provider.dart';
import 'package:capp_mobile/features/home/widget/calendar.dart';
import 'package:capp_mobile/features/home/widget/event_filters.dart';
import 'package:capp_mobile/features/home/widget/event_list.dart';
import 'package:capp_mobile/features/notifications/provider/contact_us_view_model.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:capp_mobile/shared/theme/gradients.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomeScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(projectProvider);

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          context: context,
          title: tr("project_calendar"),
          onPressedMenu: (){
            Scaffold.of(context).openDrawer();
          },
          onPressedBell: (){
            final contactUsVM = ref.read(contactUsViewModelProvider);
            contactUsVM.getNotifications("");
            context.pushRoute(NotificationsRoute());
          },
        scaffoldKey: _scaffoldKey, // Pass scaffoldState here
      ),

      drawer: CustomAppDrawer(),


      body: Consumer(builder: (context, ref, child) {
        return ListView(
          children: [
            primaryDropdown(
              context: context,
              projectTitle: tr("teo_customer_app"),
              projectLogo: icProject,
              showDropdown: projects.isNotEmpty,
              projectList: projects,
            ),

            Calendar(),

            EventFilters(),

            Padding(
              padding: EdgeInsets.only(bottom: dimensions.spacingLayoutBottom),
              child: EventList(),
            )
          ]
        );
      }),
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        child: Container(
          width: dimensions.floatingButtonSize,
          height: dimensions.floatingButtonSize,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: primaryGradient
          ),
          child: Icon(
            Icons.add,
            color: colorWhite,
            size: 30,
          ),
        ),
          onPressed: (){
          context.pushRoute(AddEventRoute(event: null));
          }),
    );
  }
}