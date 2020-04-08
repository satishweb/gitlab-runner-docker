#!/bin/bash
# Get the registration token from project settings -> Settings -> CICD -> Runners

if [[ "$2" == "" ]]; then
  echo "Registration token missing and/or runner name is missing"
  echo "Get the registration token from project settings -> Settings -> CICD -> Runners"
  echo "usage: $0 <runner-token> <runner-name>"
  exit 1
fi
regToken=${1}
runnerName=${2}

docker exec -it gitlab-runner \
  gitlab-runner register \
    --name "${runnerName}" \
    --non-interactive \
    --registration-token ${regToken} \
    --template-config /config.template.toml \
    --tag-list "docker,linux" \
    --locked=false \
    --url https://gitlab.com \
    --executor docker \
    --docker-image docker:stable \
    --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
    --builds-dir /builds \
    --cache-dir /cache \
    --shell bash \
    --cache-shared \
    --docker-privileged \
    --docker-network-mode gitlab-network

