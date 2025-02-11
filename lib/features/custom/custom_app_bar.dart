import 'package:capp_mobile/shared/constants/assets.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar customAppBar({
  required BuildContext context,
  required String title,
  VoidCallback? onPressedMenu,
  VoidCallback? onPressedBell,
  VoidCallback? onPressedBackButton,
  VoidCallback? onPressedCancel,
  required GlobalKey<ScaffoldState> scaffoldKey, //this is the key
}) {
  return AppBar(
    centerTitle: true,
    title: Text(title),
    titleTextStyle: Theme.of(context).textTheme.headlineLarge,
    leading: onPressedMenu != null
        ? IconButton(
            icon: SvgPicture.asset(icMenu, width: dimensions.iconSizePrimary, height: dimensions.iconSizePrimary),
            onPressed: (){
              scaffoldKey.currentState?.openDrawer();
            },
          )
        : (onPressedBackButton != null
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    size: dimensions.iconSizePrimary, color: Theme.of(context).primaryColor),
                onPressed: onPressedBackButton,
              )
            : null),
    actions: [
      if (onPressedBell != null)
        IconButton(
          icon: SvgPicture.asset(icBell, width: dimensions.iconSizePrimary, height: dimensions.iconSizePrimary),
          onPressed: onPressedBell,
        ),
      if (onPressedCancel != null)
        TextButton(
          onPressed: onPressedCancel,
          child: Text(tr("cancel")),
        ),
    ],
  );
}
