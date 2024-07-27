from time import sleep
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

logger.info("starting python signal connector")

while True:
    sleep(10)
    logger.info("python process checkin")