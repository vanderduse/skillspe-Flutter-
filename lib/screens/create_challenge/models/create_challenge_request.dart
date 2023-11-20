class CreateChallengeRequest {
  String challengeName = "";
  String challengeGoal;
  String challengeEmoji;
  String startDate;
  String endDate;
  int challengeFees;

  CreateChallengeRequest(
      {this.challengeName = "",
      this.challengeGoal = "",
      this.challengeEmoji = "",
      this.startDate = "",
      this.endDate = "",
      this.challengeFees = 5});
}
