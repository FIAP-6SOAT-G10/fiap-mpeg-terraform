data "aws_availability_zone" "us-east-1a" {
  name = "us-east-1a"
}

data "aws_availability_zone" "us-east-1b" {
  name = "us-east-1b"
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

data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

data "aws_iam_policy" "cluster_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "resource_controller" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

data "aws_iam_policy" "worker_node_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

data "aws_iam_policy" "cni_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

data "aws_iam_policy" "container_registry_read_only_policy" {
  arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}