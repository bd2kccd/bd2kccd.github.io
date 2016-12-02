#!/bin/bash

# generate stage site
cp mkdocs_stage.yml mkdocs.yml
mkdocs build --clean
