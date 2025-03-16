#!/bin/bash
# This script creates tags for the given Godot version to trigger the release workflow
# example usage
# sh add-tags.sh "4.4"

# Input parameters
GODOT_VERSION=$1
echo "Running add_tags.sh with GODOT_VERSION: $GODOT_VERSION"

# Create tags for different configurations
git tag -a -f godot-$GODOT_VERSION -m "[Automated workflow] Created by upgrade-godot"
git tag -a -f godot-$GODOT_VERSION-debug -m "[Automated workflow] Created by upgrade-godot"
# Push tags
git push origin -f --tags