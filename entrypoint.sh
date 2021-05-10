#!/usr/bin/env bash

export NGROK_PUBLIC=$(curl  --max-time 10 --retry 5 -s kafka-ngrok:4040/api/tunnels/command_line | python -c 'import json,sys;print(json.load(sys.stdin)["public_url"].lstrip("tcp://"))')
echo ${NGROK_PUBLIC}

export KAFKA_ADVERTISED_LISTENERS="${KAFKA_ADVERTISED_LISTENERS},PLAINTEXT_NGROK://${NGROK_PUBLIC}"
echo ${KAFKA_ADVERTISED_LISTENERS}

/etc/confluent/docker/run