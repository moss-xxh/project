#!/bin/bash

# VPP Authorization System - 完整部署脚本
# 将整个项目文件夹部署到GitHub

echo "🚀 准备部署完整的VPP Authorization System到GitHub..."

# 设置仓库URL
REPO_URL="https://github.com/moss-xxh/authorization.git"
TEMP_DIR="temp_authorization_deploy"

# 当前项目目录
PROJECT_DIR="/Users/xuexinhai/Desktop/授权书-web"

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

# 复制所有项目文件（排除.git, .DS_Store等）
echo "📋 复制所有项目文件..."
rsync -av \
    --exclude='.git' \
    --exclude='.DS_Store' \
    --exclude='temp_authorization_deploy' \
    --exclude='temp_authorization' \
    --exclude='.claude' \
    "$PROJECT_DIR/" ./

# 显示将要上传的文件
echo "📂 将要上传的文件："
ls -la

# 添加并提交文件
echo "📝 提交更改..."
git add .

# 创建详细的提交信息
git commit -m "feat: Deploy complete VPP Authorization System

✨ Features:
- Single-step customer authorization form
- Bilingual support (English/Chinese)
- Digital signature pad with touch support
- Real-time form validation
- Query and search functionality
- Authorization status tracking
- Responsive mobile-first design

📱 UI Components:
- Apple-style modern interface
- Interactive signature canvas
- Status indicators with animations
- Modal dialogs and overlays
- Progressive form submission

🖼️  Assets:
- Company logo (新logo.png)
- Help images for form fields
- Battery capacity examples
- Inverter SN examples
- Brand reference images

🔧 Technical:
- Pure HTML/CSS/JavaScript
- Tailwind CSS framework
- SignaturePad library
- Font Awesome icons
- Local storage for data persistence

📱 Browser Support:
- Modern browsers with ES6+ support
- Touch and mouse input support
- Responsive across all device sizes"

# 推送到GitHub
echo "⬆️  推送到GitHub..."
git push origin main

echo ""
echo "✅ 部署完成！"
echo "🌐 仓库地址：$REPO_URL"
echo "📂 已上传文件："
echo "   - index.html (主应用程序)"
echo "   - README.md (项目说明)"
echo "   - 新logo.png (公司Logo)"
echo "   - 电池容量.jpg (帮助图片)"
echo "   - 逆变器SN.jpg (帮助图片)"
echo "   - 品牌.jpg (帮助图片)"
echo "   - 账号.jpg (帮助图片)"
echo ""
echo "🎉 您的VPP授权系统已成功部署到GitHub！"

# 清理临时目录
cd ..
rm -rf "$TEMP_DIR"