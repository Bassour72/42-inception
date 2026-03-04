#!/bin/sh

# Start redis and bind to 0.0.0.0 so other containers can reach it
exec redis-server --protected-mode no --bind 0.0.0.0
