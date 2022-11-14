"""
Write ip and epoch
"""

import datetime
import boto3
import uuid
import os
import json
from aws_xray_sdk.core import xray_recorder
from aws_xray_sdk.core import patch_all

patch_all()


client = boto3.client("dynamodb")


def handler(event, context):
    """
    Doc string
    """
    # client_ip = event["headers"]["x-forwarded-for"] or "N/A"
    print(event)
    execution_id = uuid.uuid4()
    data = client.put_item(
        TableName=os.environ["DYNAMO_TABLE"],
        Item={
            "id": {"S": str(execution_id)},
            "Epoch": {"N": str(datetime.datetime.now().timestamp())},
            "UserIP": {"S": str(event)},
        },
    )

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json",
            "Access-Control-Allow-Origin": "*",
        },
        "body": json.dumps({"success": True, "id": str(execution_id)}),
        "isBase64Encoded": False,
    }
