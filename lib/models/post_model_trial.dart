part of very_good_project;

@freezed
class PostModelTrial with _$PostModelTrial {
  factory PostModelTrial(
    int id,
    String title,
    String body,
  ) = _PostModelTrial;

  factory PostModelTrial.fromJson(Map<String, dynamic> json) =>
      _$PostModelTrialFromJson(json);
}
