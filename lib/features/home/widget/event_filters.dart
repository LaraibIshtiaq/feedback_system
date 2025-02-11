import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/widget/check_box.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EventFilters extends ConsumerWidget {
  EventFilters({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    return Padding(
      padding: EdgeInsets.only(bottom: dimensions.spacingNormal),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 45,
        color: Theme.of(context).focusColor,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: homeViewModel.categoriesList.length,
            itemBuilder: (context, index){
              return EventCheckBox(
                checkBoxText: homeViewModel.categoriesList[index].stringValue,
                categoryNumber: homeViewModel.categoriesList[index].index,
                checkboxState: true,
                onChange: (){},
              );
            },
          )
      ),
    );
  }
}