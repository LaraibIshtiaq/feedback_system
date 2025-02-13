import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ReviewSubmittedScreen extends ConsumerWidget {
  String screenTitle;
  String mainTitle;
  String subTitle;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ReviewSubmittedScreen({super.key,
    required this.screenTitle,
  required this.mainTitle,
  required this.subTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          context: context,
          title: screenTitle,
          scaffoldKey: _scaffoldKey,
          onPressedBackButton: (){
            //Navigate it back to home
            ref.read(homeViewModelProvider).getEvents();
            context.maybePop();
          },
          onPressedBell: (){
            //Navigate it to message
          }
      ),
      body: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: dimensions.spacingMedium,
          vertical: dimensions.spacingExtraLarge),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: dimensions.floatingButtonSize,
                    backgroundColor: Theme.of(context).focusColor,
                    child: Icon(Icons.verified,
                    color: Theme.of(context).primaryColor,
                    size: 80
                    ),
                  ),

                  Text(tr("\n$mainTitle"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall
                  ),

                  Text("\n$subTitle",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: colorTextSecondaryLight
                      )),
                  Text("\n${tr("kind_regards")}\n${tr("teo")}",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorTextSecondaryLight
                      )),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}