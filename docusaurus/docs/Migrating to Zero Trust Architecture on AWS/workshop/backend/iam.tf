# ---------- frontend/iam.tf ----------

# ECS Execution Task Role
resource "aws_iam_role" "ecs_task_execution_role" {
  name        = "backend-ecsTaskExecutionRole"
  path        = "/"
  description = "ECS Execution Role."

  # managed_policy_arns is deprecated, usage moved to aws_iam_role_policy_attachment below
  assume_role_policy  = data.aws_iam_policy_document.ecs_task_role_assume.json

  inline_policy {
    name   = "EcsExecPerms"
    policy = data.aws_iam_policy_document.ecs_task_role_inline.json
  }
}

resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# ECS Execution Task Role
resource "aws_iam_role" "ecs_task_role" {
  name        = "mservice1"
  path        = "/"
  description = "Allows ECS tasks to call AWS services on your behalf."

  # managed_policy_arns is deprecated, usage moved to aws_iam_role_policy_attachment below
  assume_role_policy  = data.aws_iam_policy_document.ecs_task_role_assume.json

  inline_policy {
    name   = "EcsExecPerms"
    policy = data.aws_iam_policy_document.ecs_task_role_inline.json
  }
}

resource "aws_iam_role_policy_attachment" "ecs_task_role_policy" {
  role       = aws_iam_role.ecs_task_role.name
  policy_arn = "arn:aws:iam::aws:policy/VPCLatticeServicesInvokeAccess"
}

# Lambda Function Role
resource "aws_iam_role" "lambda_role" {
  name        = "mservice2"
  path        = "/"
  description = "Lambda function role."

  # managed_policy_arns is deprecated, usage moved to aws_iam_role_policy_attachment below
  assume_role_policy  = data.aws_iam_policy_document.lambda_function_role_assume.json
}

resource "aws_iam_role_policy_attachment" "lambda_role_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# IAM Policies
data "aws_iam_policy_document" "ecs_task_role_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "ecs_task_role_inline" {
  statement {
    sid    = "EcsExecPerms"
    effect = "Allow"
    actions = [
      "ssmmessages:CreateControlChannel",
      "ssmmessages:CreateDataChannel",
      "ssmmessages:OpenControlChannel",
      "ssmmessages:OpenDataChannel",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "lambda_function_role_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}


