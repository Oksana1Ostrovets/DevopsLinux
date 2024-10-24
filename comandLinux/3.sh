usage() {
  echo "Використання: $0 -p <шлях> -s <текст>"
  exit 1
}

while getopts "p:s:" opt; do
  case $opt in
    p) DIRECTORY=$OPTARG ;;
    s) SEARCH_TEXT=$OPTARG ;;
    *) usage ;;
  esac
done

if [ -z "$DIRECTORY" ] || [ -z "$SEARCH_TEXT" ]; then
  usage
fi

if [ ! -d "$DIRECTORY" ]; then
  echo "Директорія не існує: $DIRECTORY"
  exit 1
fi

echo "Файли, які містять текст '$SEARCH_TEXT' в директорії '$DIRECTORY':"
grep -rl "$SEARCH_TEXT" "$DIRECTORY"
