FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest

RUN apt install python3

COPY signalbot.py