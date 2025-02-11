import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppDrawer extends ConsumerWidget {
  const CustomAppDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Column(
        children: [
          _buildHeader(context),

          Padding(
            padding: EdgeInsets.symmetric(vertical: dimensions.spacingLarge),
            child: Divider(
              thickness: 1,
              color: colorGreyFourthVariant,
            ),
          ),

          _buildMenuItems(context, ref),

          Spacer(),

          _buildFooter(context),

        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: dimensions.spacingExtraLarge,
          left: dimensions.spacingMedium,
          right: dimensions.spacingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35,
                backgroundColor: Theme.of(context).focusColor,
                child: Image.asset(imageProfile),
              ),
              CircleAvatar(
                radius: 15,
                backgroundColor: Theme.of(context).focusColor,
                child: IconButton(
                  icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 15,
                  color: Theme.of(context).primaryColor,),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
          SizedBox(height: dimensions.spacingSmall),
          Text("Morten Lange",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text("Director",
            style: Theme.of(context).textTheme.labelMedium?.copyWith(color: colorTextSecondaryLight)
          ),
          SizedBox(height: dimensions.spacingSmall),
        ],
      ),
    );
  }

  Widget _buildMenuItems(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    int selectedIndex = ref.watch(homeViewModel.selectedDrawer);

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: dimensions.spacingMedium),
      child: Column(
        children: [
          _buildSectionTitle(tr("menu_items"), context),
          _buildDrawerItem(context, selectedIndex == 0 ? icCalendarActive : icCalendarInActive, tr("calendar"),ref, 0),
          _buildDrawerItem(context, selectedIndex == 1 ? icTeamsActive : icTeamsInActive, tr("team"),ref, 1),
          _buildDrawerItem(context, selectedIndex == 2 ? icContactActive : icContactInActive, tr("contact_us"),ref, 2),
          _buildSectionTitle(tr("more"), context),
          _buildDrawerItem(context, selectedIndex == 3 ? icSettingActive : icSettingInActive, tr("settings"), ref, 3),
          _buildDrawerItem(context, icLogout, tr("logout"),ref, 4),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      BuildContext context,
      String asset,
      String title,
      WidgetRef ref,
      int index) {
    final homeViewModel = ref.read(homeViewModelProvider);
    int selectedDrawer = ref.watch(homeViewModel.selectedDrawer);
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: SvgPicture.asset(
            asset,
          width: dimensions.iconSizeSecondary,
          height: dimensions.iconSizeSecondary,
        ),
        title: Text(
          title,
          style: TextStyle(color: selectedDrawer == index ?
          Theme.of(context).primaryColor : Colors.black),
        ),
        onTap: () {
          ref.read(homeViewModel.selectedDrawer.notifier).state = index;
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title, BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: colorTextSecondaryLight)
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: dimensions.spacingSmall),
      child: Image.asset(logoTeo, height: 60),
    );
  }
}
