FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest
USER root
RUN apt-get install -y python
USER signal-cli
COPY signalbot.py .
