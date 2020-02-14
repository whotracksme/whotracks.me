provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.aws_region}"
}

resource "aws_lambda_function" "clean-whotracks-me-logs" {
  function_name    = "${var.function_Name}"
  handler          = "lambda_function.lambda_handler"
  runtime          = "python3.7"
  source_code_hash = filebase64sha256("function.zip")
  description      = "An Amazon S3 trigger that retrieves metadata for the object that has been updated."
  role             = "${resource.aws_iam_role.clean-who-tracks-me-logs.arn}"
  timeout          = 303
  memory_size      = 384
  publish          = true
  tags = {
    Name    = "${var.function_Name}"
    Owner   = "${var.tag_Owner}"
    Project = "${var.tag_Project}"
  }
}

resource "aws_iam_role" "clean-who-tracks-me-logs" {
  name               = "${var.function_Name}"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "s3:DeleteObject"
            ],
            "Resource": "arn:aws:s3:::who-tracks-me-logs/access-logs/*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": "cloudwatch:PutMetricData",
            "Resource": "*"
        }
    ]
}
EOF
  tags = {
    Name    = "${resource.aws_iam_role.whotracks-me-logs-clean-up.name}"
    Owner   = "${var.tag_Owner}"
    Project = "${var.tag_Project}"
  }
}

