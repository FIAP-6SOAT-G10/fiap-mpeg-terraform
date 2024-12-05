resource "aws_sns_topic" "payment_updates" {
  name            = "updates-payments-topic"
  delivery_policy = <<EOF
  {
    "http": {
      "defaultHealthyRetryPolicy": {
        "minDelayTarget": 20,
        "maxDelayTarget": 20,
        "numRetries": 3,
        "numMaxDelayRetries": 0,
        "numNoDelayRetries": 0,
        "numMinDelayRetries": 0,
        "backoffFunction": "linear"
      },
      "disableSubscriptionOverrides": false,
      "defaultThrottlePolicy": {
        "maxReceivesPerSecond": 1
      }
    }
  }
  EOF
}

resource "aws_sns_topic_subscription" "payment_updates_order_sqs_target" {
  topic_arn             = aws_sns_topic.payment_updates.arn
  protocol              = "sqs"
  endpoint              = var.order_payment_updates_queue_arn
  raw_message_delivery  = true
}

resource "aws_sns_topic_subscription" "payment_updates_production_sqs_target" {
  topic_arn = aws_sns_topic.payment_updates.arn
  protocol  = "sqs"
  endpoint  = var.production_payment_updates_queue_arn
  raw_message_delivery  = true
}