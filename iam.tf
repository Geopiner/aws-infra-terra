resource "aws_iam_role" "ec2_role" {
    name = "${var.env_prefix}-ec2-role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
            Service = "ec2.amazonaws.com"
            }
        }
        ]
    })
}

resource "aws_iam_policy" "ec2_ssm_custom_policy" {
  name        = "${var.env_prefix}-ec2-ssm-policy"
  description = "Custom policy allowing EC2 instance to use SSM and Parameter Store"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = [
          "ssm:DescribeInstanceInformation",
          "ssm:GetParameter",
          "ssm:GetParameters",
          "ssm:GetParametersByPath",
          "ssm:PutInventory",
          "ssm:ListInventoryEntries",
          "ssm:SendCommand",
          "ssm:ListCommands",
          "ssm:ListCommandInvocations",
          "ssm:UpdateInstanceInformation",
          "ssm:ListAssociations",
          "ssm:UpdateAssociationStatus",
          "ssm:UpdateInstanceAssociationStatus"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "ec2messages:AcknowledgeMessage",
          "ec2messages:DeleteMessage",
          "ec2messages:FailMessage",
          "ec2messages:GetEndpoint",
          "ec2messages:GetMessages",
          "ec2messages:SendReply"
        ],
        Resource = "*"
      },
      {
        Effect = "Allow",
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ec2_ssm_custom" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = aws_iam_policy.ec2_ssm_custom_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
    name = "${var.env_prefix}-ec2-instance-profile"
    role = aws_iam_role.ec2_role.name
}