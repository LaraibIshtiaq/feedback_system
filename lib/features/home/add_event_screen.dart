import 'package:auto_route/auto_route.dart';
import 'package:capp_mobile/domain/model/enums/categories.dart';
import 'package:capp_mobile/domain/model/ui_dto/event.dart';
import 'package:capp_mobile/domain/model/ui_dto/event_category.dart';
import 'package:capp_mobile/features/custom/confirmation_popup.dart';
import 'package:capp_mobile/features/custom/custom_app_bar.dart';
import 'package:capp_mobile/features/custom/primary_button.dart';
import 'package:capp_mobile/features/custom/primary_text_field.dart';
import 'package:capp_mobile/features/home/provider/home_view_model.dart';
import 'package:capp_mobile/features/home/widget/category_item.dart';
import 'package:capp_mobile/features/home/widget/date_picker_field.dart';
import 'package:capp_mobile/shared/constants/constants.dart';
import 'package:capp_mobile/shared/theme/app_colors.dart';
import 'package:capp_mobile/shared/theme/app_dimens.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class AddEventScreen extends ConsumerWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Event? event;
  AddEventScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel = ref.read(homeViewModelProvider);
    var selectedCategory = ref.watch(homeViewModel.selectedCategory);
    var startDate = ref.watch(homeViewModel.startDate);
    var endDate = ref.watch(homeViewModel.endDate);
    var enable = ref.watch(homeViewModel.enableAddEvent);
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(
          context: context,
          title: tr("add_event"),
          onPressedBackButton: (){
            //Navigate to previous screen
            homeViewModel.restoreValuesInTextField(ref);
            event = null;
            context.maybePop();
          },
          onPressedCancel: (){
            // show the dialog
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ConfirmationPopup(
                  dialogTitle: tr("confirmation"),
                  dialogSubTitle: tr("are_you_sure_you_want_to_cancel?all_the_event_details_you've_entered_will_be_lost."),
                  confirmationText: event!=null
                      ? tr("keep_updating")
                      : tr("keep_adding"),
                  onPressedCancel: () {
                    homeViewModel.restoreValuesInTextField(ref);
                    event = null;
                    context.maybePop();
                    context.router.back();
                  },
                  onPressedOk: () {
                    context.maybePop();
                  },
                );
              },
            );
          },
        scaffoldKey: _scaffoldKey
      ),
      body: Consumer(builder: (context, ref, child) {
        return Padding(
            padding: EdgeInsets.only(
                top: dimensions.spacingExtraLarge,
                left: dimensions.spacingMedium,
                right: dimensions.spacingMedium,
            bottom: dimensions.spacingMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      PrimaryTextField(
                        textEditingController: homeViewModel.eventNameController,
                        hintText: tr("event_name"),
                        maxLine: 1,
                        isRequired: true,
                        onChanged: (String value){
                          ref.read(homeViewModel.enableAddEvent.notifier).state = homeViewModel.eventNameController.text.trim().isNotEmpty;
                        },
                      ),

                      Row(
                        children: [
                          datePickerField(
                            fieldText: tr("start_date"),
                            context: context,
                            selectedDate: homeViewModel.startDate,
                            ref: ref,
                            startLimit: null,
                            endLimit: endDate
                          ),

                          SizedBox(width: 10),

                          datePickerField(
                              fieldText: tr("end_date"),
                              context: context,
                              selectedDate:  homeViewModel.endDate,
                              ref: ref,
                              startLimit: startDate,
                              endLimit: null
                          )
                        ],
                      ),

                      PrimaryTextField(
                        textEditingController: homeViewModel.eventNoteController,
                        hintText: tr("type_the_note_here"),
                        maxLine: 3,
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical:  dimensions.spacingLarge),
                        child: Row(
                          children: [
                            Text(tr("select_category"),
                              style: Theme.of(context).textTheme.bodyLarge),
                            Text(" *",
                                style: TextStyle(color: colorRed)),

                          ],
                        ),
                      ),

                      Expanded(
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, // Number of items in one row
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 3.8, // Adjust height-to-width ratio
                          ),
                          itemCount: Categories.values.length,
                          itemBuilder: (context, index) {
                            final category = Categories.values[index];
                            return categoryItem(
                                category,
                                context,
                                selectedCategory == category.stringValue,
                                (){
                                  ref.read(homeViewModel.selectedCategory.notifier).state = category.stringValue;
                                  selectedCategory = category.stringValue;
                                }
                            );
                          },
                        ),
                      )
                    ]
                ),
              ),
              PrimaryButton(
                  buttonText: tr("save"),
                  enable: enable,
                  onPressed: () async {
                    event = Event(
                      eventId: event?.eventId,
                      projectId: projectId,
                      projectName: "testproject",
                      eventName: homeViewModel.eventNameController.text,
                      startDate: startDate,
                      endDate: endDate,
                      eventCategory: EventCategory.fromString(selectedCategory),
                      eventNote: homeViewModel.eventNoteController.text,
                    );

                    if(event?.eventId != null){
                      ///Update the existing event
                      homeViewModel.updateEvent(event!);
                      homeViewModel.restoreValuesInTextField(ref);
                      event = null;
                      context.maybePop();
                    }
                    else{
                      /// Add a new event
                      homeViewModel.addEvent(event!);
                      homeViewModel.restoreValuesInTextField(ref);
                      event = null;
                      context.maybePop();
                    }
                  })
            ],
          ),
        );
      }),
    );
  }

  highlightRequiredFields() {

  }
}
