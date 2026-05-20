# CLAUDE.md

本文件为 Claude Code (claude.ai/code) 操作此代码库提供指引。

## 仓库概述

这是 **luomor-apps** 单体仓库（monorepo），托管在 `https://apps.luomor.com` 的静态 Web 应用集合。仓库结构：

- `public/` — 所有已部署的 Web 应用（静态 HTML/CSS/JS）
- `docs/` — 文档和操作记录
- `public/assets/` — 共享静态资源（图片、favicon），`apps.json` 列出全部应用

首页（`public/index.html`）是应用列表页面，位于 `https://apps.luomor.com/`，带 SEO 元数据展示所有可用应用。应用注册信息在 `public/assets/apps.json`。

## 项目结构

```
public/
├── index.html            # 首页入口（React/Vite 构建的单页应用）
├── assets/               # 共享静态文件 + apps.json 应用列表
├── lottery-color-ball/   # 双色球随机选号（CRA React 应用）
├── lottery-random/       # 随机选号器
├── yuan/                 # 缘计时器
├── math/                 # 数学函数演示（正弦、心形、曲线等）
├── qixi2023/             # 七夕节互动页面
├── xmas2020/, xmas2021/  # 圣诞节主题页面
├── bootstrap-baidu-map/  # 百度地图集成（jQuery + Bootstrap）
├── earth/                # 3D 地球可视化
├── emoji-scavenger-hunt/ # AR Emoji 寻宝游戏（含 TensorFlow.js 模型）
├── foolredpacket/        # 红包动画
├── summary-2020/         # 年度总结页面
├── aiflow/               # 流程图工具（基于 Ant Design）
├── pyscript/             # PyScript 在线编辑器（Svelte + TypeScript）
└── ...                   # 其他静态演示页面
```

## 各应用技术栈

| 应用 | 技术栈 | 备注 |
|------|--------|------|
| `pyscript/pyscriptjs/` | Svelte + TypeScript + Tailwind + Rollup | 唯一保留源码可开发的应用 |
| `lottery-color-ball/` | React (CRA) | 包含 manifest.json、build 产物 |
| 大部分其他应用 | 纯 HTML/CSS/JS | 无构建系统，直接修改静态文件 |

## 命令

### pyscript（唯一可开发的源码项目）

```bash
cd public/pyscript/pyscriptjs
npm install
npm run dev          # 启动热重载开发服务器
npm run build        # 生产环境构建
npm run validate     # 运行 svelte-check
npm run lint         # ESLint
npm run lint:fix     # ESLint 自动修复
npm run format       # Prettier 格式化
npm run start        # 在 8080 端口提供构建后的静态文件
```

### 通用

- 大部分应用已是构建好的静态站点，直接在 HTML/CSS/JS 文件中修改即可
- 首页（`public/index.html`）由引用 `/assets/index-apps.*.js` 的 SPA 构建
- 新增应用时按现有格式添加到 `public/assets/apps.json`

## 部署

应用以静态文件形式托管在 `https://apps.luomor.com/<app-name>/`，每个应用在 `public/` 下对应一个独立子目录，内含各自的 `index.html`。本仓库未配置 CI/CD。

## 关键文件

- `public/index.html` — 主入口页面，含 SEO（Open Graph、Schema.org、Twitter Card）和统计（Google Adsense、Google Analytics、百度统计）
- `public/assets/apps.json` — 首页加载的应用列表数据源
- `changelog.txt` — 中文版本变更记录
