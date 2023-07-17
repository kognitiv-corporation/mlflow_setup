#!/bin/bash

# Step 1: Install dependencies
pip install mlflow

# Step 2: Set AWS credentials (replace with your own credentials or use an IAM role)
export AWS_ACCESS_KEY_ID=<your_aws_access_key_id>
export AWS_SECRET_ACCESS_KEY=<your_aws_secret_access_key>
export AWS_DEFAULT_REGION=<your_aws_default_region>

# Step 3: Initialize the MLflow tracking server with S3 backend store and artifact root
mlflow server \
    --backend-store-uri aws://<your_s3_bucket>/mlflow-db \
    --default-artifact-root s3://<your_s3_bucket>/mlflow-artifacts \
    --host 0.0.0.0

# Step 4: Create a new terminal window/tab and activate the virtual environment (if applicable)

# Step 5: Set the MLFLOW_TRACKING_URI environment variable
export MLFLOW_TRACKING_URI=http://localhost:5000

# Step 6: Create a new experiment (optional)
mlflow experiments create --experiment-name "My Experiment"

# Step 7: Run your MLflow project
mlflow run <your_mlflow_project_directory>
