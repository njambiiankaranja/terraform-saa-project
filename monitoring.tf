# 1. Create an SNS Topic for CloudWatch Alerts
resource "aws_sns_topic" "alerts" {
  name = "saa-infrastructure-alerts"
}

# 2. Subscribe your email address to the SNS Topic
resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.alerts.arn
  protocol  = "email"
  endpoint  = var.admin_email # This pulls the email you defined in variables.tf
}

# 3. Create a CloudWatch CPU Utilization Alarm for your EC2 Web Server
resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "saa-ec2-high-cpu"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300 # 5 minutes
  statistic           = "Average"
  threshold           = 80 # 80% CPU usage threshold
  alarm_description   = "This metric monitors EC2 CPU utilization and triggers if it exceeds 80%"

  dimensions = {
    InstanceId = aws_instance.web.id
  }

  alarm_actions = [aws_sns_topic.alerts.arn]
}