#!/bin/bash
git add . >/dev/null; git commit -m "update" >/dev/null; git push origin master >/dev/null

LATEST=$(ls -t AR_Audit_*.md | head -n 1)
# 只要 BUG 后面不是“无”或“None”就报警
BUG_DETAIL=$(grep "BUG:" "$LATEST" | grep -ivE "无|None" | sed 's/BUG://g')

if [ -n "$BUG_DETAIL" ]; then
    say -v "Meijia" "发现故障。故障详情是：$BUG_DETAIL"
else
    # 完美通过
    say "BINGO"
fi
