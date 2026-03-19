# 3D Site Planner

A full-bleed Mapbox + Three.js construction site planning tool for mocking up buildings, infrastructure, and site layouts on 3D satellite maps.

## Features

- **Full-bleed 3D satellite map** with terrain, pitch, and multiple style options
- **Drawing tools** — Rectangle, Circle, Polygon, Line, Box, Cylinder via right-click context menu
- **Building system** — Draw footprints, extrude floors (9/10/12/14 ft heights), 8 material presets
- **Infrastructure splines** — Road, Sidewalk, Driveway, Sewer, Water, Electrical with CatmullRom curves
- **Estimation panel** — Auto-calculated SF/LF with editable $/unit pricing and CSV export
- **3D model import** — GLB/GLTF/OBJ with DRACO decompression support
- **Project save/load** — JSON serialization of full site plans
- **Undo/Redo**, keyboard shortcuts, raycasting object selection

## Setup

### Environment Variables

| Variable | Description |
|---|---|
| `MAPBOX_TOKEN` | Your Mapbox GL JS access token |

### Vercel Deployment

1. Connect this repo to Vercel
2. Add `MAPBOX_TOKEN` as an environment variable in Vercel project settings
3. Deploy — the build script injects the token automatically

### Local Development

Replace `YOUR_MAPBOX_ACCESS_TOKEN` in `index.html` line 310 with your Mapbox token, then open `index.html` directly or serve with any static server:

```bash
npx serve . -l 3000
```

## Usage

1. **Navigate** — Search addresses or paste coordinates in the bottom bar
2. **Draw** — Click the pen icon (right sidebar) to enter Drawing Mode, then right-click for the tool menu
3. **Build** — Draw a rectangle footprint → adjust floors, materials, height in the properties panel
4. **Estimate** — Click the grid icon to open the estimation panel, enter $/unit costs
5. **Save** — Click the save icon to export your project as JSON

## Tech Stack

- [Mapbox GL JS](https://docs.mapbox.com/mapbox-gl-js/) v3.20.0 — 3D satellite maps
- [Three.js](https://threejs.org/) r170 — 3D rendering via CustomLayerInterface
- Vanilla JS — no framework dependencies
