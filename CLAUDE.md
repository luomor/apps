# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is the **luomor-apps** monorepo — a collection of static web apps hosted at `https://apps.luomor.com`. The repo structure:

- `public/` — all deployed web applications (static HTML/CSS/JS)
- `docs/` — documentation and command logs
- `public/assets/` — shared assets (images, favicon), `apps.json` lists all apps

The landing page (`public/index.html`) is the app directory at `https://apps.luomor.com/`, listing all available apps with SEO metadata. Apps are registered in `public/assets/apps.json`.

## Project Structure

```
public/
├── index.html            # Landing page (React/Vite-built SPA)
├── assets/               # Shared static files + apps.json registry
├── lottery-color-ball/   # Double Color Ball lottery number picker (CRA React app)
├── lottery-random/       # Random lottery picker
├── yuan/                 # Yuan countdown timer
├── math/                 # Math function demos (sin, heart, curves)
├── qixi2023/             # Qixi Festival interactive page
├── xmas2020/, xmas2021/  # Christmas themed pages
├── bootstrap-baidu-map/  # Baidu Maps integration (jQuery + Bootstrap)
├── earth/                # 3D globe visualization
├── emoji-scavenger-hunt/ # AR Emoji scavenger game (TensorFlow.js model included)
├── foolredpacket/        # Red envelope animation
├── summary-2020/         # Annual summary page
├── aiflow/               # Flowchart tool (Ant Design-based)
├── pyscript/             # PyScript playground (Svelte + TypeScript)
└── ...                   # Other static demo pages
```

## Tech Stacks by App

| App | Stack | Notes |
|-----|-------|-------|
| `pyscript/pyscriptjs/` | Svelte + TypeScript + Tailwind + Rollup | Only app with tracked source code |
| `lottery-color-ball/` | React (CRA) | Has manifest.json, static/build artifacts |
| Most other apps | Plain HTML/CSS/JS | No build system, pre-built static files |

## Commands

### pyscript (the only app with developable source code)

```bash
cd public/pyscript/pyscriptjs
npm install
npm run dev          # Start dev server with hot reload
npm run build        # Production build
npm run validate     # Run svelte-check
npm run lint         # ESLint
npm run lint:fix     # ESLint auto-fix
npm run format       # Prettier format
npm run start        # Serve built assets on port 8080
```

### General

- Most apps are already-built static sites — modifications are made directly to the HTML/CSS/JS files
- The landing page (`public/index.html`) is built from a source SPA referencing `/assets/index-apps.*.js`
- Add new apps to `public/assets/apps.json` following the existing format

## Deployment

Apps are served as static files from `https://apps.luomor.com/<app-name>/`. Each app is a subdirectory under `public/` with its own `index.html`. No CI/CD config exists in this repo.

## Key Files

- `public/index.html` — Main landing page with SEO (Open Graph, Schema.org, Twitter Card) and analytics (Google Ads, Google Analytics, Baidu Tongji)
- `public/assets/apps.json` — App registry used by the landing page to list all apps
- `changelog.txt` — Version tracking log in Chinese
