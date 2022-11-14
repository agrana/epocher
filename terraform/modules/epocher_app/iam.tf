data "aws_iam_policy" "Cloudwatch" {
  arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
}

data "aws_iam_policy" "DynamoDB" {
  arn = "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
}

data "aws_iam_policy" "XRay" {
  arn = "arn:aws:iam::aws:policy/AWSXrayFullAccess"
}

resource "aws_iam_role_policy_attachment" "Clouwatch" {
  role       = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${data.aws_iam_policy.Cloudwatch.arn}"
}

resource "aws_iam_role_policy_attachment" "DynamoDB" {
  role       = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${data.aws_iam_policy.DynamoDB.arn}"
}

resource "aws_iam_role_policy_attachment" "XRay" {
  role       = "${aws_iam_role.iam_for_lambda.name}"
  policy_arn = "${data.aws_iam_policy.XRay.arn}"
}
