import 'package:capp_mobile/data/remote/models/post_notification.dart';
import 'package:capp_mobile/data/remote/models/received_notifications.dart';
import 'package:capp_mobile/domain/model/ui_dto/team_member.dart';
import 'package:capp_mobile/domain/providers/notifiactions_repo_provider.dart';
import 'package:capp_mobile/domain/repositories/notifications_repository.dart';
import 'package:capp_mobile/features/notifications/provider/notification_provider.dart';
import 'package:capp_mobile/features/notifications/provider/selected_recipients_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final contactUsViewModelProvider = Provider((ref) {
  final notificationRepository = ref.watch(notificationsRepositoryProvider);
  final notificationsListManager = ref.read(notificationProvider.notifier);
  final selectedRecipientProvider = ref.read(selectedRecipientsProvider.notifier);
  return ContactUsViewModel(
      notificationsRepository: notificationRepository,
      selectedRecipientsManager: selectedRecipientProvider,
      notificationNotifier: notificationsListManager,
      ref: ref);
});


class ContactUsViewModel{
  Ref ref;
  final NotificationsRepository notificationsRepository;
  final SelectedRecipientsManager selectedRecipientsManager;
  final NotificationNotifier notificationNotifier;

  ContactUsViewModel({
    required this.notificationsRepository,
    required this.selectedRecipientsManager,
    required this.notificationNotifier,
    required this.ref
  }){
    ///Edit to incorporate userId
    getNotifications("");
  }

  TextEditingController notificationContentController = TextEditingController(text: "");

  ///TODO: For temp purpose, will delete later when api is built
  List<TeamMember> teamMembers = [
    TeamMember(
        memberId: "cdef6789-63e6-4975-8f83-f1248e7b1bac",
        memberName: "Syed Ashraf",
        memberDesignation: "Project Manager"),
    TeamMember(
        memberId: "eea778b1-f465-4ca2-a443-5cdcdc52b196",
        memberName: "Tariq Iqbal",
        memberDesignation: "Account Manager"),
    TeamMember(
        memberId: "99b170ae-5cc9-4d87-b65a-621ec60fdfb6",
        memberName: "Laraib Ishtiaq",
        memberDesignation: "Customer Advisor"),
    TeamMember(
        memberId: "6f728991-a54e-4e68-95fd-23ae3a1eb520",
        memberName: "My Extended Team",
        memberDesignation: "My CSCS"),
  ];

  sendNotification(PostNotification notification) async {
    dynamic result = await notificationsRepository.addNotifications(
        notification.toJson(notification));
  }

  getNotifications(String userId) async {
    List<ReceivedNotifications> result = await notificationsRepository.getInboxNotifications("99b170ae-5cc9-4d87-b65a-621ec60fdfb6"/*userId*/);
    if(result.isNotEmpty){
      notificationNotifier.replaceAllReceivedNotifications(result);
    }
  }
}