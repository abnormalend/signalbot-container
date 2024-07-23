FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest

RUN apt-get install -y python3

COPY signalbot.py .