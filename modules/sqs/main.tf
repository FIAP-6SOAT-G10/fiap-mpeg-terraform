data "aws_iam_policy_document" "order_payment_updates_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [
      aws_sqs_queue.order_payment_updates_queue.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.payment_updates_arn]
    }
  }
}

data "aws_iam_policy_document" "production_payment_updates_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [
      aws_sqs_queue.production_payment_updates_queue.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.payment_updates_arn]
    }
  }
}

resource "aws_sqs_queue" "payment_requests_queue" {
  name                  = "payment-requests-queue"
  redrive_policy        = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.payment_requests_queue_dlq.arn,
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "payment_requests_queue_dlq" {
  name = "payment-requests-queue-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_payment_requests" {
  queue_url = aws_sqs_queue.payment_requests_queue_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.payment_requests_queue.arn]
  })
}

resource "aws_sqs_queue" "order_payment_updates_queue" {
  name = "order-payment-updates-queue"
  redrive_policy        = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.order_payment_updates_queue_dql.arn,
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "order_payment_updates_queue_dql" {
  name = "order-payment-updates-queue-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_order_payment_updates" {
  queue_url = aws_sqs_queue.order_payment_updates_queue_dql.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.order_payment_updates_queue.arn]
  })
}

resource "aws_sqs_queue" "production_payment_updates_queue" {
  name = "production-payment-updates-queue"
  redrive_policy        = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.production_payment_updates_queue_dql.arn,
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "production_payment_updates_queue_dql" {
  name = "production-payment-updates-queue-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_production_payment_requests" {
  queue_url = aws_sqs_queue.production_payment_updates_queue_dql.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.production_payment_updates_queue.arn]
  })
}

resource "aws_sqs_queue" "production_order_requests_queue" {
  name                  = "production-order-requests-queue"
  redrive_policy        = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.production_order_requests_queue_dlq.arn,
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "production_order_requests_queue_dlq" {
  name = "production-order-requests-queue-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_production_order_requests" {
  queue_url = aws_sqs_queue.production_order_requests_queue_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.production_order_requests_queue.arn]
  })
}

resource "aws_sqs_queue_policy" "order_payment_updates_queue_policy" {
  queue_url = aws_sqs_queue.order_payment_updates_queue.id
  policy    = data.aws_iam_policy_document.order_payment_updates_policy_document.json
}

resource "aws_sqs_queue_policy" "production_payment_updates_queue_policy" {
  queue_url = aws_sqs_queue.production_payment_updates_queue.id
  policy    = data.aws_iam_policy_document.production_payment_updates_policy_document.json
}