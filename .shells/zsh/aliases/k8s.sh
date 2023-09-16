
alias -g -- --dry="--dry-run=client -o yaml"

# super ugly but cant get it working otherwise
alias -g -- --clean="| yq e 'del(.. | select(has(\"status\")).status) | del(.. | select(has(\"uid\")).uid) | del(.. | select(has(\"selfLink\")).selfLink) | del(.. | select(has(\"creationTimestamp\")).creationTimestamp) | del(.. | select(has(\"annotations\")).annotations) | del(.. | select(has(\"generation\")).generation) | del(.. | select(has(\"ownerReferences\")).ownerReferences)'"
