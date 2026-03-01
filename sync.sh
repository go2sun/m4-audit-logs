#!/bin/bash
# 1. 自动同步到 GitHub
git add .
git commit -m "📊 自动审计结晶: $(date +'%H:%M:%S')"
git push origin master

# 2. 提取最新一份审计报告的 AI 描述
LATEST_FILE=$(ls -t AR_Audit_*.md | head -n 1)
ANALYSIS=$(grep -v "^#" "$LATEST_FILE" | grep -v "^!" | grep -v "^$" | head -n 1)

# 3. M4 系统语音播报 (使用 Siri 风格声音)
say -v "Meijia" "审计同步成功。视觉发现：$ANALYSIS"
