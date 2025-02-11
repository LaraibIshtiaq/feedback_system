import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedbackButton extends ConsumerWidget {
  String eventId;
  String assetImage;
  String label;
  bool isSelected;
  VoidCallback onTap;
  /// Creates a FeedbackButton with the given properties.
  FeedbackButton({
    super.key,
    required this.eventId,
    required this.assetImage,
    required this.label,
    required this.isSelected,
    required this.onTap
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      child: Column(
        children: [
          Container(
              height: dimensions.feedbackButtonHeight,
              width: dimensions.feedbackButtonHeight,
              padding: EdgeInsets.all(dimensions.spacingMediumLarge),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).focusColor,
              ),
              child: SvgPicture.asset(assetImage)
          ),

          Text(label,
              style: (isSelected)? Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color:  Theme.of(context).primaryColor)
                  :
              Theme.of(context).textTheme.bodyMedium
          )
        ],
      ),
    );
  }
}