#!/usr/bin/env bash

set -e

function push {
    # bash-friendly way to get current branch name
    local branch=$(git rev-parse --abbrev-ref HEAD)
    echo "Current git branch is ${branch}"

    local repo="ppanyukov/mesos-discovery-go:${branch}"
    echo "Will push to repo: ${repo}"

    # These var are set in travis
    docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"
}

push

