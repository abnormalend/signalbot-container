from time import sleep
import logging
import requests
from jsonrpcclient import request, parse, Ok
from uuid import uuid4
import json

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("starting python signal connector")
jsonRPC_address="http://127.0.0.1:8551/api/v1/rpc"
headers = {'Content-Type': 'application/json'}
signalbot_phone = "+16163450952"
brent_phone = "+16166343297"
# payload = {
#     'jsonrpc': '2.0',
#     'method': 'send',
#      "id": "uuid4().__str__()",
#         "params": {
#             "account": signalbot_phone,
#             "recipients": [brent_phone],
#             "message": "Test"
#         }
# }

# payload_json = json.dumps(payload)

# r = requests.post(jsonRPC_address,headers=headers, data=payload_json)
# logger.info(r.status_code)
# logger.info(r.json())

response = requests.post(jsonRPC_address, json=request("send", account=signalbot_phone, recipients=[brent_phone], message="Test"))
print('Response:', response.data)


while True:
    sleep(10)
    logger.info("python process checkin")