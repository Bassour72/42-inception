#!/bin/sh


set -e

exec /usr/bin/cadvisor -logtostderr "$@"

