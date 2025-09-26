#!/bin/bash
set -xe

# Get the S3 bucket name from the CloudFormation stack outputs
S3_BUCKET=$(aws cloudformation describe-stacks --stack-name codedeploy-lab --query 'Stacks[0].Outputs[?OutputKey==`DeploymentBucket`].OutputValue' --output text)

# Copy war file from S3 bucket to tomcat webapp folder
aws s3 cp s3://${S3_BUCKET}/SpringBootHelloWorldExampleApplication.war /usr/local/tomcat9/webapps/SpringBootHelloWorldExampleApplication.war


# Ensure the ownership permissions are correct.
chown -R tomcat:tomcat /usr/local/tomcat9/webapps