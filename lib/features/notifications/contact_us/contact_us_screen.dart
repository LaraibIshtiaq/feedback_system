import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/data/remote/models/post_notification.dart';
import 'package:capp_mobile/domain/model/ui_dto/team_member.dart';
import 'package:capp_mobile/features/notifications/provider/contact_us_view_model.dart';
import 'package:capp_mobile/features/notifications/provider/selected_recipients_provider.dart';
import 'package:capp_mobile/features/notifications/widget/pop_up_list.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/custom/primary_button.dart';
import 'package:capp_mobile/features/custom/primary_text_field.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ContactUsScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contactUsViewModel = ref.read(contactUsViewModelProvider);
    final selectedRecipients = ref.read(selectedRecipientsProvider.notifier);

    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          context: context,
          title: tr("contact_teo"),
          scaffoldKey: _scaffoldKey,
          onPressedMenu: (){
            ///Navigate it back to menu

          },
          onPressedBell: (){
            ///Navigate it to home screen
            Navigator.pop(context);
          }
      ),
      body: Consumer(builder: (context, ref, child) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: dimensions.spacingMedium),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: dimensions.spacingLayoutTop),
                    child: Text(tr("A request, a complaint or simply an appreciation? Please let us know, so we can help ASAP"),
                        style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: colorTextSecondaryLight
                        )),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: dimensions.spacingLarge,
                    bottom: dimensions.spacingMedium),
                    child: Text(tr("choose_recipients"),
                    style: Theme.of(context).textTheme.bodyMedium,),
                  ),


                  ///Dropdown options to choose recipients
                  PopUpList(),

                  Divider(
                    thickness: 1,
                    color: colorGreyFourthVariant,
                  ),

                  PrimaryTextField(
                    textEditingController: contactUsViewModel.notificationContentController,
                    hintText: tr("Please share your insights"),
                    maxLine: 8,
                  ),
                ],
              ),

              Spacer(),

              Padding(
                padding: EdgeInsets.symmetric(vertical: dimensions.spacingMedium),
                child: PrimaryButton(
                    buttonText: tr("send"),
                    onPressed: (){
                      List<TeamMember> selectedMembers = selectedRecipients.getSelectedMemberOnly();
                      PostNotification notification = PostNotification(
                          content: contactUsViewModel.notificationContentController.text,
                          recipients: selectedMembers);

                      contactUsViewModel.notificationContentController.text = "";

                      ///Proceed with sending message to server
                      contactUsViewModel.sendNotification(notification);
                      Navigator.pop(context);

                      ///Navigate to thanks screen
                      context.pushRoute(ReviewSubmittedRoute(
                          screenTitle: tr("successfully_sent"),
                          mainTitle: tr("thanks_for_reaching_out"),
                          subTitle: tr("thanks_message_contact_us")
                      ));
                    }
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}