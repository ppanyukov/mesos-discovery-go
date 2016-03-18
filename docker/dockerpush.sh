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

    # Copy all built stuff to files dir here
    local dir=$(dir $0)
    mkdir -p ${dir}/files
    cp -r "${GOPATH}/bin" "${dir}/files/bin"

    docker build -t "${repo}" "${dir}"
    docker push "${repo}"
}

push

