data "aws_availability_zone" "us-east-1a" {
  name = "us-east-1a"
}

data "aws_availability_zone" "us-east-1b" {
  name = "us-east-1b"
}

data "aws_iam_policy_document" "assume_role_fiap_fast_food" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "lab_role_document" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "cognito-idp.amazonaws.com",
        "eks-fargate-pods.amazonaws.com",
        "firehose.amazonaws.com",
        "deepracer.amazonaws.com",
        "backup.amazonaws.com",
        "autoscaling.amazonaws.com",
        "sagemaker.amazonaws.com",
        "apigateway.amazonaws.com",
        "ec2.application-autoscaling.amazonaws.com",
        "batch.amazonaws.com",
        "pipes.amazonaws.com",
        "kinesis.amazonaws.com",
        "scheduler.amazonaws.com",
        "states.amazonaws.com",
        "s3.amazonaws.com",
        "cloudformation.amazonaws.com",
        "ecs.amazonaws.com",
        "athena.amazonaws.com",
        "rekognition.amazonaws.com",
        "sqs.amazonaws.com",
        "servicecatalog.amazonaws.com",
        "iot.amazonaws.com",
        "resource-groups.amazonaws.com",
        "codewhisperer.amazonaws.com",
        "rds.amazonaws.com",
        "lambda.amazonaws.com",
        "forecast.amazonaws.com",
        "ec2.amazonaws.com",
        "credentials.iot.amazonaws.com",
        "cloudtrail.amazonaws.com",
        "cloud9.amazonaws.com",
        "eks.amazonaws.com",
        "logs.amazonaws.com",
        "elasticloadbalancing.amazonaws.com",
        "iotanalytics.amazonaws.com",
        "elasticfilesystem.amazonaws.com",
        "codedeploy.amazonaws.com",
        "ecs-tasks.amazonaws.com",
        "application-autoscaling.amazonaws.com",
        "sns.amazonaws.com",
        "redshift.amazonaws.com",
        "elasticbeanstalk.amazonaws.com",
        "dynamodb.amazonaws.com",
        "events.amazonaws.com",
        "codecommit.amazonaws.com",
        "secretsmanager.amazonaws.com",
        "databrew.amazonaws.com",
        "ssm.amazonaws.com",
        "kms.amazonaws.com",
        "iotevents.amazonaws.com",
        "kinesisanalytics.amazonaws.com",
        "glue.amazonaws.com",
        "elasticmapreduce.amazonaws.com"
      ]
    }

    principals {
      type = "AWS"
      identifiers = [var.lab_role]
    }
  }
}