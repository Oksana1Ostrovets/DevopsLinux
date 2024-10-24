
if [ "$#" -ne 2 ]; then
  echo "Використання: $0 <шлях> <текст>"
  exit 1
fi

DIRECTORY=$1
SEARCH_TEXT=$2

if [ ! -d "$DIRECTORY" ]; then
  echo "Директорія не існує: $DIRECTORY"
  exit 1
fi

echo "Файли, які містять текст '$SEARCH_TEXT' в директорії '$DIRECTORY':"
grep -rl "$SEARCH_TEXT" "$DIRECTORY"
