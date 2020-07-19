#!/bin/bash
docker exec -ti ${PWD##*/} /bin/bash -c "$*"
