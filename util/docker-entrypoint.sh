#!/bin/bash
set -e

export NODE_ENV=production
export VERSION=$(git rev-parse HEAD || echo "unknown")

# use forever to manage service
forever --killTree app.js
