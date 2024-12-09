import json

def lambda_handler(event, context):
    for record in event['Records']:
        if record['eventName'] == "INSERT":
            event_data = record['dynamodb']['NewImage']
            print(f"Deduplicated Event: {json.dumps(event_data)}")
