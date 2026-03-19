#!/bin/bash
# Build script for Vercel deployment
# Injects MAPBOX_TOKEN env variable into index.html

mkdir -p dist
cp index.html dist/index.html

if [ -n "$MAPBOX_TOKEN" ]; then
  # Use node for safe string replacement (handles special chars in tokens)
  node -e "
    const fs = require('fs');
    const token = process.env.MAPBOX_TOKEN;
    let html = fs.readFileSync('dist/index.html', 'utf8');
    html = html.replace(
      \"window.__MAPBOX_TOKEN || 'YOUR_MAPBOX_ACCESS_TOKEN'\",
      JSON.stringify(token)
    );
    fs.writeFileSync('dist/index.html', html);
    console.log('✓ MAPBOX_TOKEN injected (' + token.substring(0, 8) + '...)');
  "
else
  echo "⚠ MAPBOX_TOKEN not set — using placeholder"
fi
