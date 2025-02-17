FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest
WORKDIR /app
COPY signalbot.py .
COPY wrapper.sh .
USER root
RUN --mount=type=cache,id=artifacts-${IMAGE_VARIANT},target=/artifacts \
 --mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
 --mount=type=cache,target=/var/cache/apt,sharing=locked \
 bash <<EOF
apt-get update
apt-get -y upgrade
apt-get -y install \
    python3 \
    python3-pip
pip install boto3 requests jsonrpcclient 
chmod +x ./wrapper.sh
EOF
USER signal-cli
ENTRYPOINT ["/app/wrapper.sh"]
