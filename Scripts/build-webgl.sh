#!/bin/bash

# Parse arguments
DEBUG=false
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -d|--debug) DEBUG=true ;;
        *) echo "Unknown parameter: $1"; exit 1 ;;
    esac
    shift
done

# Ensure build directory exists
mkdir -p build/web

# Build the project
cd godot
if [ "$DEBUG" = true ]; then
    godot --headless --export-debug "Web-Develop" ../build/web/index.html
	TEMPLATE_PATH="godot/WebGLTemplates/Develop"
else
    godot --headless --export-release "Web-Release" ../build/web/index.html
	TEMPLATE_PATH="godot/WebGLTemplates/Release"
fi

# Copy WebGL template files (js, css, svg, etc)
cd ..
find "$TEMPLATE_PATH" -type f -not -name "index.html" -not -name "*.import" -exec cp {} build/web/ \;