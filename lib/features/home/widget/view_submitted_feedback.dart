import 'package:capp_mobile/domain/model/enums/rating.dart';
import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/features/custom/secondary_dropdown.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


///Widget used to display submitted feedback of user in a bottom sheet
Widget viewSubmittedFeedback(
    BuildContext context,
    Event event,
    Rating ratingValue){
  return ListView(
    padding: EdgeInsets.symmetric(horizontal: dimensions.spacingMedium,
        vertical: dimensions.spacingLayoutBottom),
    shrinkWrap: true,
    children: <Widget>[
      Text(tr("submitted_review_for"),
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorTextSecondaryLight),
        textAlign: TextAlign.center,),
      Text("${tr("release")}: ${event.eventName}",
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,),

      Padding(
        padding: EdgeInsets.symmetric(vertical: dimensions.spacingMedium),
        child: secondaryDropdown(
          context: context,
          projectTitle: tr("teo_customer_app"),
          projectLogo: icProject,
          showDropdown: true,
          values: [imageProfile,logoTeo],
        ),
      ),


      Text("${tr("rated_as")}:", style: Theme.of(context).textTheme.headlineLarge),
      Padding(
        padding: EdgeInsets.symmetric(vertical: dimensions.spacingMedium),
        child: Row(
          children: [
            SizedBox(
              width: dimensions.iconSizeSecondary,
              height: dimensions.iconSizeSecondary,
              child: SvgPicture.asset(
                ratingValue.activeAssetImage,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: dimensions.spacingSmall),
              child: Text(ratingValue.stringValue, style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorTextSecondaryLight)),
            ),
          ],
        ),
      ),
      Text("${tr("comments")}:", style: Theme.of(context).textTheme.headlineLarge),
      Padding(
        padding: EdgeInsets.symmetric(vertical: dimensions.spacingMedium),
        child: Text(event.feedbacks!.first.feedbackNote,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorTextSecondaryLight)),
      ),
    ],
  );
}