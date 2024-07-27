FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest
USER root
RUN apt update && apt upgrade -y && 
    apt install -y python3 &&
    pip install boto3
USER signal-cli
COPY signalbot.py .
COPY wrapper.sh .
ENTRYPOINT ["wrapper.sh"]
