#!/bin/bash
# 1. 后台静默同步
git add . > /dev/null 2>&1
git commit -m "📊 Audit: $(date +'%H:%M:%S')" > /dev/null 2>&1
git push origin master > /dev/null 2>&1

# 2. 提取最新 AI 结论
LATEST_FILE=$(ls -t AR_Audit_*.md | head -n 1)
# 寻找非空的 BUG 字段
BUG_INFO=$(grep "BUG:" "$LATEST_FILE" | grep -v "None" | sed 's/BUG://g' | xargs)

# 3. 逻辑播报
if [ -n "$BUG_INFO" ]; then
    # 发现具体 Bug 内容
    say -v "Meijia" "发现故障。关键点：$BUG_INFO"
else
    # 没发现 Bug，只说 BINGO
    say "BINGO"
fi
