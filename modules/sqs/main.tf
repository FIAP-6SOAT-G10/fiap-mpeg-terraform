data "aws_iam_policy_document" "request_video_processor_policy_document" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["s3.amazonaws.com"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [
      aws_sqs_queue.sqs_request_video_processor.arn
    ]

    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values   = [var.aws_s3_bucket_fiap_mpeg_processor_in_arn]
    }
  }
}

resource "aws_sqs_queue" "sqs_request_video_processor" {
  name                        = "sqs-request-video-processor"
  redrive_policy              = jsonencode({
    deadLetterTargetArn       = aws_sqs_queue.sqs_request_video_processor_dlq.arn,
    maxReceiveCount           = 10
  })
  visibility_timeout_seconds  = 120
}

resource "aws_sqs_queue" "sqs_request_video_processor_dlq" {
  name = "sqs-request-video-processor-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_request_video_processor" {
  queue_url = aws_sqs_queue.sqs_request_video_processor_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.sqs_request_video_processor.arn]
  })
}

resource "aws_sqs_queue" "sqs_request_video_notificator" {
  name                  = "sqs-request-video-notificator"
  redrive_policy        = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.sqs_request_video_notificator_dlq.arn,
    maxReceiveCount     = 10
  })
}

resource "aws_sqs_queue" "sqs_request_video_notificator_dlq" {
  name = "sqs-request-video-notificator-dlq"
}

resource "aws_sqs_queue_redrive_allow_policy" "queue_redrive_request_video_notificator" {
  queue_url = aws_sqs_queue.sqs_request_video_notificator_dlq.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.sqs_request_video_notificator.arn]
  })
}

resource "aws_sqs_queue_policy" "request_video_processor_policy" {
  queue_url = aws_sqs_queue.sqs_request_video_processor.id
  policy    = data.aws_iam_policy_document.request_video_processor_policy_document.json
}