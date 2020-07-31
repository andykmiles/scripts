#!/bin/bash
putup $1 --tox --no-skeleton --travis
cd $1
cp cp -r /home/andy/ws/stds/vscode-py/containers/python-3/.devcontainer .
cp -r /home/andy/ws/stds/vscode-py/containers/python-3/requirements.txt .
code .