data "archive_file" "lambda_hello_world" {
  type = "zip"
  source_dir  = "${path.module}/hello-world"
  output_path = "${path.module}/hello-world.zip"
}

resource "aws_s3_object" "lambda_hello_world" {
  bucket = var.s3_bucket
  key    = "hello-world2.zip"
  source = data.archive_file.lambda_hello_world.output_path
  etag = filemd5(data.archive_file.lambda_hello_world.output_path)
}


resource "aws_lambda_function" "hello_world" {
  function_name = "hello_world-${var.env}"
  s3_bucket = var.s3_bucket
  s3_key    = aws_s3_object.lambda_hello_world.key
  runtime = var.pythonver
  handler = "hello.handler"
  source_code_hash = data.archive_file.lambda_hello_world.output_base64sha256
  role = aws_iam_role.lambda_exec.arn
  memory_size = var.memory
  timeout = var.timeout
}

resource "aws_iam_role" "lambda_exec" {
  name = "serverless_lambda-${var.env}" 

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Sid    = ""
      Principal = {
        Service = "lambda.amazonaws.com"
      }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}



