import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/domain/model/enums/rating.dart';
import 'package:capp_mobile/data/remote/models/event.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/widget/view_submitted_feedback.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/routes/route.gr.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReleaseFeedbackIcon extends ConsumerWidget {
  Event event;

  ReleaseFeedbackIcon({super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        InkWell(
        onTap: () => handleTap(context, ref, homeViewModel),
        child: SizedBox(
          width: dimensions.iconSizeSecondary,
          height: dimensions.iconSizeSecondary,
          child: SvgPicture.asset(
            event.feedbacks!.isEmpty ? icGiveFeedback : icViewFeedback,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    ],
    );
  }

  void handleTap(BuildContext context, WidgetRef ref, HomeViewModel homeViewModel) {
    if (event.endDate.isAfter(DateTime.now())) {
      ref.read(homeViewModel.showToolTip.notifier).state = true;
      Future.delayed(Duration(milliseconds: 1000), () {
        ref.read(homeViewModel.showToolTip.notifier).state = false;
      });
    } else if (event.feedbacks!.isEmpty) {
      context.pushRoute(GiveFeedbackRoute(event: event));
    } else {
      showModalBottomSheet(
        showDragHandle: true,
        enableDrag: true,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          Rating ratingValue = Rating.values.elementAt(event.feedbacks!.first.rating - 1);
          return viewSubmittedFeedback(context, event, ratingValue);
        },
      );
    }
  }
}