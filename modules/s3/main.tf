resource "aws_s3_bucket" "fiap_mpeg_processor_in" {
  bucket = "processor-in"

  tags = {
    Name        = "FIAP MPEG Processor IN S3"
  }
}

resource "aws_s3_bucket" "fiap_mpeg_processor_out" {
  bucket = "processor-out"

  tags = {
    Name        = "FIAP MPEG Processor OUT S3"
  }
}

resource "aws_s3_bucket_notification" "fiap_mpeg_processor_in_notification" {
  bucket          = aws_s3_bucket.fiap_mpeg_processor_in.id

  queue {
    queue_arn     = var.aws_sqs_fiap_mpeg_processor_in_arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".mp4"
  }
}