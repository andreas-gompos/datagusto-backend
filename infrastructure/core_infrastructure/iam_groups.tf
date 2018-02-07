resource "aws_iam_group" "serving_ai_group" {
  name = "serving_ai_group"
  path = "/users/"
}

resource "aws_iam_group_policy_attachment" "serving_ai_group_policy_attachment" {
  group      = "${aws_iam_group.serving_ai_group.name}"
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}