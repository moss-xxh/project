#!/bin/bash

# VPP Authorization System - GitHub Upload Script
# 使用说明：在终端中运行此脚本来上传代码到GitHub

echo "🚀 准备上传VPP Authorization System到GitHub..."

# 设置仓库URL
REPO_URL="https://github.com/moss-xxh/authorization.git"
TEMP_DIR="temp_authorization"

# 检查是否已存在临时目录
if [ -d "$TEMP_DIR" ]; then
    echo "📁 删除旧的临时目录..."
    rm -rf "$TEMP_DIR"
fi

# 克隆仓库
echo "📥 克隆仓库..."
git clone "$REPO_URL" "$TEMP_DIR"

# 进入仓库目录
cd "$TEMP_DIR"

# 清空现有文件（除了.git目录）
echo "🗑️  清空现有文件..."
find . -type f ! -path "./.git/*" ! -name ".git*" -delete
find . -type d ! -path "./.git" ! -path "./.git/*" ! -name "." -exec rm -rf {} + 2>/dev/null || true

# 复制新文件
echo "📋 复制新文件..."
cp "../index.html" .
cp "../README.md" .

# 添加并提交文件
echo "📝 提交更改..."
git add .
git commit -m "feat: Update VPP authorization system

- Implement single-step form submission
- Add bilingual support (English/Chinese)  
- Include digital signature functionality
- Add query and search features
- Implement responsive design
- Add authorization status tracking"

# 推送到GitHub
echo "⬆️  推送到GitHub..."
git push origin main

# 清理
cd ..
rm -rf "$TEMP_DIR"

echo "✅ 上传完成！"
echo "🌐 访问您的仓库：$REPO_URL"