import 'package:capp_mobile/domain/model/ui_dto/team_member.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedRecipientsProvider = StateNotifierProvider((ref) {
  return SelectedRecipientsManager({});
});


class SelectedRecipientsManager extends StateNotifier<Map<String, bool>>{

  SelectedRecipientsManager(super.state){
    initializeAll(teamMembers);
  }
  ///TODO: Will remove later, after having api of recipients
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

  ///Initialize the selected values with all team members un-selected
  initializeAll(List<TeamMember> teamMembers) {
    try{
      Map<String, bool> selectedValues = {};
      for (var member in teamMembers) {
        selectedValues[member.memberId] = false;
      }
      state = selectedValues;
    }catch (e) {
      return;
    }
  }

  updateMemberSelection(String teamMemberId, bool newSelectionState){
    Map<String, bool> previousState =  state;
    previousState.update(teamMemberId, (value) => newSelectionState);
    state = previousState;
  }

  getSelectedMemberOnly(){
    List<TeamMember> selectedTeamMembers=[];
    state.forEach((element, elementSelection){
      if(elementSelection){
        selectedTeamMembers.add(
            teamMembers.firstWhere((member) => member.memberId == element)
        );
      }
    });
    return selectedTeamMembers;
  }
}