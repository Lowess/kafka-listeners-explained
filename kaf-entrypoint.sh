#!/usr/bin/env sh

export NGROK_PUBLIC=$(curl  --max-time 10 --retry 5 -s kafka-ngrok:4040/api/tunnels/command_line| jq -r .public_url | sed 's#tcp://##')

echo "Ngrok Public endpoint: ${NGROK_PUBLIC}"

# Configure local
kaf config remove-cluster local /dev/null 2>&1 || true;
kaf config add-cluster local -b kafka:9092

# Configure ngrok
kaf config remove-cluster ngrok > /dev/null 2>&1 || true;
kaf config add-cluster ngrok -b "${NGROK_PUBLIC}"

exec ${@}
