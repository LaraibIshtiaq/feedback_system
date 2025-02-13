

class TeamMember{
  String memberId;
  String memberName;
  String memberDesignation;

  TeamMember({
    required this.memberId,
    required this.memberName,
    required this.memberDesignation
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
        memberId: json['member_id']??"",
        memberName: json['member_name']??"",
        memberDesignation: json["designation"]??""
    );
  }

  Map<String, dynamic> toJson(TeamMember teamMember){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['member_id'] = teamMember.memberId;
    data['member_name'] = teamMember.memberName;
    data['designation'] = teamMember.memberDesignation;
    return data;
  }

  Map<String, dynamic> toJsonForNotificationPostCall(TeamMember teamMember){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipientId'] = teamMember.memberId;
    data['recipientName'] = teamMember.memberName;
    data['isRead'] = false;
    return data;
  }
}