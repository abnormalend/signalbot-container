FROM registry.gitlab.com/packaging/signal-cli/signal-cli-native:latest
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
pip install boto3
EOF

WORKDIR /app
USER signal-cli
COPY signalbot.py .
COPY wrapper.sh .
RUN  --mount=type=cache,id=artifacts-${IMAGE_VARIANT},target=/artifacts \
--mount=type=cache,target=/var/lib/apt/lists,sharing=locked \
--mount=type=cache,target=/var/cache/apt,sharing=locked \
bash <<EOF
chmod +x ./wrapper.sh
ENTRYPOINT ["./wrapper.sh"]
