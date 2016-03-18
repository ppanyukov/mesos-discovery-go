#!/usr/bin/env bash

set -e

function push {
    # bash-friendly way to get current branch name
    # local branch=$(git rev-parse --abbrev-ref HEAD)
    local branch=${TRAVIS_BRANCH}
    local pr=${TRAVIS_PULL_REQUEST}
    local buildno=${TRAVIS_BUILD_NUMBER}
    
    echo "Current git branch is ${branch}"
    echo "Current git PR number is ${pr}"

    # Not so easy to do tagging...
    local dockertag=""
    if [ "${pr}" = "false" ]; then
        dockertag="${branch}"
    else
        dockertag="${branch}-pr-${pr}"
    fi

    local repo="ppanyukov/mesos-discovery-go:${dockertag}"
    echo "Will push to repo: ${repo}"

    # These var are set in travis
    docker login -e="$DOCKER_EMAIL" -u="$DOCKER_USERNAME" -p="$DOCKER_PASSWORD"

    # Copy all built stuff to files dir here
    local dir=$(dirname $0)
    mkdir -p ${dir}/files
    cp -r "${GOPATH}/bin" "${dir}/files/bin"

    docker build -t "${repo}" "${dir}"
    docker push "${repo}"
}

push

