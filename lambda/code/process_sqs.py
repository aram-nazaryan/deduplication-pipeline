import boto3
import json
import os

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['DYNAMODB_TABLE'])

def lambda_handler(event, context):
    for record in event['Records']:
        body = json.loads(record['body'])
        event_id = body['event_id']

        # Try to insert into DynamoDB
        try:
            table.put_item(
                Item={
                    'event_id': event_id,
                    'timestamp': body['timestamp'],
                    'event_data': body['event_data'],
                    'ttl': int(time.time()) + 86400  # TTL = 24 hours
                },
                ConditionExpression="attribute_not_exists(event_id)"
            )
        except Exception as e:
            print(f"Duplicate event detected: {event_id}")
