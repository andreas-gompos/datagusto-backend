resource "aws_iam_group_membership" "serving_ai_group" {
  name = "serving_ai-membership"

  users = [
    "${aws_iam_user.ioannis_gkioulekas.name}"
  ]

  group = "${aws_iam_group.serving_ai_group.name}"
}