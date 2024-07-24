FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest
USER root
RUN apt-get update && apt-get upgrade -y && 
    apt-get install -y python3 &&
    pip install boto3
USER signal-cli
COPY signalbot.py .
ENTRYPOINT ["/usr/bin/signal-cli", "daemon", "--tcp", "0.0.0.0:8551"]
