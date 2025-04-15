resource "aws_elastic_beanstalk_application" "beanstalk_app" {
  name        = var.name
  description = var.description
}

resource "aws_elastic_beanstalk_environment" "beanstalk_env" {
  name                = var.environment
  application         = aws_elastic_beanstalk_application.beanstalk_app.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.5.0 running Docker"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.machine
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    value     = var.max_size
  }
}

resource "aws_elastic_beanstalk_application_version" "beanstalk_app_version" {
  depends_on = [
    aws_elastic_beanstalk_environment.beanstalk_env,
    aws_elastic_beanstalk_application.beanstalk_app,
    aws_s3_object.docker_run
  ]

  name        = var.environment
  application = var.name
  description = var.description
  bucket      = aws_s3_bucket.beanstalk_deploys.id
  key         = aws_s3_object.docker_run.id
}
