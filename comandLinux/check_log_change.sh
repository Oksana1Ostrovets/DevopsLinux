LOG_FILE="/var/log/my-app.log"

LAST_CHECK_FILE="/tmp/my_app_last_check.txt"

LAST_MODIFIED=$(stat -c %Y "$LOG_FILE")
CURRENT_SIZE=$(stat -c %s "$LOG_FILE")

if [ ! -f "$LAST_CHECK_FILE" ]; then
    echo "$LAST_MODIFIED" > "$LAST_CHECK_FILE"
fi

LAST_CHECK=$(cat "$LAST_CHECK_FILE")

if [ "$LAST_MODIFIED" -ne "$LAST_CHECK" ]; then
    redis-cli HMSET my_app_log size "$CURRENT_SIZE" modified_at "$(date -d @"$LAST_MODIFIED" +"%Y-%m-%d %H:%M:%S")"
    
    echo "$LAST_MODIFIED" > "$LAST_CHECK_FILE"
fi
