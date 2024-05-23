#!/bin/bash

BUCKET_NAME="qoala-test-bucket"  # Replace with the name of your S3 bucket
BACKUP_FOLDER="s3-backups"  
BACKUP_NAME="s3_backup_$(date +"%Y-%m-%d")"  

# Check if AWS CLI is installed
if ! which aws &> /dev/null; then
  echo "Error: AWS CLI is not installed. Please install it from https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html."
  exit 1
fi

# Create the local backup folder if it doesn't exist
mkdir -p "$BACKUP_FOLDER"

# Download the entire bucket to the local folder
aws s3 sync "s3://$BUCKET_NAME" "$BACKUP_FOLDER/$BACKUP_NAME"


echo "Backup completed! Local path: $BACKUP_FOLDER/$BACKUP_NAME"

