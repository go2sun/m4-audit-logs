#!/bin/bash
# 1. 后台静默推送到 GitHub
git add . > /dev/null 2>&1
git commit -m "📊 Audit: $(date +'%H:%M:%S')" > /dev/null 2>&1
git push origin master > /dev/null 2>&1

# 2. 扫描最新审计结果
LATEST_FILE=$(ls -t AR_Audit_*.md | head -n 1)
# 寻找非空的 BUG 字段
BUG_INFO=$(grep "BUG:" "$LATEST_FILE" | grep -iv "None" | sed 's/BUG://g' | xargs)

# 3. 中文播报逻辑
if [ -n "$BUG_INFO" ]; then
    # 只要 BUG 后面有字且不是 None，就报警
    say -v "Meijia" "发现故障。关键点：$BUG_INFO"
else
    # 全绿通过，清脆一声 BINGO
    say "BINGO"
fi
