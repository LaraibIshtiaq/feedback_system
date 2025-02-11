import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/domain/model/enums/rating.dart';
import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/domain/model/ui_dto/feedback.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/custom/primary_button.dart';
import 'package:capp_mobile/features/custom/primary_text_field.dart';
import 'package:capp_mobile/features/feedback/provider/feedback_view_model.dart';
import 'package:capp_mobile/features/feedback/widget/feedback_button.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///Screen to add feedback with a respective event
@RoutePage()
class GiveFeedbackScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Event event;
  GiveFeedbackScreen({
    super.key,
    required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final feedbackViewModel = ref.read(feedbackViewModelProvider);
    int status = ref.watch(feedbackViewModel.eventStatus);
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          context: context,
          title: tr("release_feedback"),
          scaffoldKey: _scaffoldKey,
          onPressedMenu: (){
            //Navigate it back to menu
          },
          onPressedBell: (){
            //Navigate it to message
          }
      ),
      body: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.spacingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Column(
                children: [
                  Text(tr("how_satisfied_are_you_with"),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: colorTextSecondaryLight
                      )),

                  Text(event.eventName,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: dimensions.spacingExtraLarge),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FeedbackButton(
                          eventId: event.eventId!,
                          assetImage: status == 1 ?
                          Rating.notSatisfied.activeAssetImage :
                          Rating.notSatisfied.inActiveAssetImage,
                          label: tr("not_satisfied"),
                          isSelected: status == 1,
                          onTap: (){
                            ref.read(feedbackViewModel.eventStatus.notifier).state = 1;
                          },),
                        FeedbackButton(
                          eventId: event.eventId!,
                          assetImage: status == 2 ?
                          Rating.satisfied.activeAssetImage :
                          Rating.satisfied.inActiveAssetImage,
                          label: tr("satisfied"),
                          isSelected: status == 2,
                          onTap: (){
                            ref.read(feedbackViewModel.eventStatus.notifier).state = 2;
                          },),
                        FeedbackButton(
                          eventId: event.eventId!,
                          assetImage: status == 3 ?
                          Rating.verySatisfied.activeAssetImage :
                          Rating.verySatisfied.inActiveAssetImage,
                          label: tr("very_satisfied"),
                          isSelected: status == 3,
                          onTap: (){
                            ref.read(feedbackViewModel.eventStatus.notifier).state = 3;
                          },),
                      ],
                    ),
                  ),

                  PrimaryTextField(
                    textEditingController: feedbackViewModel.eventFeedbackController,
                    hintText: tr("let_us_know_how_it_went_and_how_we_can_improve"),
                    maxLine: 8,
                  ),
                ],
              ),

              Spacer(),

              Column(
                  children: [
                    Text(
                      tr("your_response_will_be_sent_to_teo_customer_advisor.",),
                      style: Theme.of(context).textTheme.labelSmall,
                    textAlign: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: dimensions.spacingMedium),
                      child: PrimaryButton(
                          buttonText: tr("submit"),
                          onPressed: (){
                            final feedback = EventFeedback(
                              eventId: event.eventId,
                              feedbackNote: feedbackViewModel.eventFeedbackController.text,
                              reviewedBy: "Laraib Ishtiaq",
                              rating: status,
                            );

                            feedbackViewModel.addFeedback(feedback);
                            context.maybePop();


                            //Navigate to thanks screen
                            context.pushRoute(ReviewSubmittedRoute());
                          }
                      ),
                    )
                  ]
              )
            ],
          ),
        );
      }),
    );
  }
}