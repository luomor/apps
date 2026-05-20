# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是 [烙馍网](https://apps.luomor.com) 的部署仓库，一个静态 Web 应用集合平台。平台首页（Vue.js + Vite 构建）展示并链接到多个独立的 HTML5 小游戏和工具页面。

## 仓库结构

```
├── public/                        # 静态部署文件（部署根目录）
│   ├── index.html                 # 主入口页（SPA，Vue 构建产物）
│   ├── assets/
│   │   ├── index-apps.*.js        # 主应用 JS 包
│   │   ├── index-apps.*.css       # 主应用 CSS 包
│   │   └── apps.json              # 应用列表数据（维护游戏/工具链接）
│   ├── <app-name>/                # 各个独立子应用（每个目录是一个独立的 HTML5 应用）
│   └── favicon.ico
├── docs/
│   └── README.md
├── changelog.txt                  # 旧版变更日志
└── .gitignore
```

## 关键文件说明

- **`public/index.html`** — 主入口 SPA 页面，包含 SEO 标签、Google Ads、Google Analytics (G-87JET1FJ65)、百度统计。通过 `<div id="app">` 挂载 Vue 应用。
- **`public/assets/apps.json`** — 应用列表配置，定义首页展示的所有应用/游戏的标题、描述、图标和链接。新增应用时需在此文件添加条目。
- **`public/<app-name>/`** — 每个子目录是一个独立的 HTML5 应用，直接通过 `https://apps.luomor.com/<app-name>/` 访问。

## 常用操作

### 新增一个子应用

1. 在 `public/` 下创建新目录，放入构建好的静态文件
2. 在 `public/assets/apps.json` 的 `apps` 数组中添加条目：
   ```json
   {
     "title": "应用名称",
     "description": "应用描述",
     "images": [{"src": "https://apps.luomor.com/assets/html-logo.png"}],
     "url": "https://apps.luomor.com/your-app-name/"
   }
   ```

### 修改首页

首页是 Vite 构建的 Vue SPA。源码不在本仓库中（源码在另一个开发仓库），本仓库只包含构建产物。如需修改首页逻辑，需要找到源码仓库重新构建后替换 `public/assets/index-apps.*` 文件和 `public/index.html`。

### SEO 优化

- `public/index.html` 已包含完整的 SEO 标签（title、description、keywords、Open Graph、Twitter Card、Schema.org 结构化数据）
- 域名：`https://apps.luomor.com`
- 各子应用页面需要在各自的 `index.html` 中单独优化 SEO

## 技术栈

- **主页面**: Vue.js + Vite + Element UI
- **子应用**: 各应用技术栈不同（原生 JS/Canvas/WebGL/PyScript 等）
- **部署**: 静态文件部署，无构建步骤
- **分析**: Google Analytics + 百度统计
- **广告**: Google AdSense (ca-pub-6096731848877113)

## 注意事项

- 本仓库是**部署产物仓库**，不包含源码和构建工具（无 package.json、无 Vite 配置）
- 所有变更直接修改 `public/` 下的静态文件后推送即可
- 修改 `apps.json` 后无需重新构建，直接生效
- 源码仓库位于 D 盘 dev 目录的其他位置
