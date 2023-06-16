data "archive_file" "lambda" {
  type        = "zip"
  source_file = "terraform_funciton.py"
  output_path = "terraform_funciton.zip"
}

resource "aws_lambda_function" "terraform_lambda" {
  filename      = "terraform_funciton.zip"
  function_name = "terraform-lambda"
  role          = aws_iam_role.lambda_role.arn
  handler       = "terraform_funciton.lambda_handler"
  runtime = "python3.10"
}
