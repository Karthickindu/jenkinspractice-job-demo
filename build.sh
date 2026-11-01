#!/bin/bash
set -e

echo "Starting Build"
python3 --version
python3 app/app.py
echo "Build completed successfully"
