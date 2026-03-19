#!/bin/bash
# Build script for Vercel deployment
# Injects MAPBOX_TOKEN env variable into index.html

mkdir -p dist
cp index.html dist/index.html

if [ -n "$MAPBOX_TOKEN" ]; then
  # Inject the token as a global variable before the module script
  sed -i "s|window.__MAPBOX_TOKEN || 'YOUR_MAPBOX_ACCESS_TOKEN'|'${MAPBOX_TOKEN}'|g" dist/index.html
  echo "✓ MAPBOX_TOKEN injected"
else
  echo "⚠ MAPBOX_TOKEN not set — using placeholder"
fi
