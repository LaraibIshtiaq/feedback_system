import 'package:capp_mobile/features/notifications/provider/contact_us_view_model.dart';
import 'package:capp_mobile/features/notifications/provider/selected_recipients_provider.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PopUpList extends ConsumerStatefulWidget {
  const PopUpList({super.key});

  @override
  ConsumerState<PopUpList> createState() => _PopUpListState();
}

class _PopUpListState extends ConsumerState<PopUpList> {
  @override
  Widget build(BuildContext context) {
    final contactUsViewModel = ref.watch(contactUsViewModelProvider);
    var selectedRecipientsManager = ref.watch(selectedRecipientsProvider.notifier).debugState; // ✅ Watch the state

    return PopupMenuButton<int>(
      offset: const Offset(0, 50),
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width - dimensions.spacingMedium,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dimensions.cornerRadiusSecondary),
      ),
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Container(
            width: MediaQuery.of(context).size.width,
            constraints: const BoxConstraints(maxHeight: 200),
            child: ListView(
              shrinkWrap: true,
              children: contactUsViewModel.teamMembers.map((option) {
                return CheckboxListTile(
                  title: Text(
                    option.memberName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  subtitle: Text(
                    option.memberDesignation,
                    style: Theme.of(context).textTheme.labelMedium!
                        .copyWith(color: colorTextSecondaryLight),
                  ),
                  value: selectedRecipientsManager[option.memberId] ?? false,
                  onChanged: (value) {
                    ref
                        .read(selectedRecipientsProvider.notifier)
                        .updateMemberSelection(option.memberId, value!);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              }).toList(),
            ),
          ),
        ),
      ],
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: dimensions.spacingSmall),
        padding: EdgeInsets.symmetric(
          horizontal: dimensions.spacingMedium,
          vertical: dimensions.spacingMedium,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).focusColor,
          border: Border.all(color: Theme.of(context).focusColor),
          borderRadius: BorderRadius.circular(dimensions.cornerRadiusSecondary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              tr("select"),
              style: Theme.of(context).textTheme.labelMedium!
                  .copyWith(color: colorTextSecondaryLight),
            ),
            Icon(Icons.keyboard_arrow_down_outlined, color: colorTextSecondaryLight),
          ],
        ),
      ),
    );
  }
}