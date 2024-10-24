usage() {
  echo "Використання: $0 <шлях> <розширення>"
  exit 1
}

if [ $# -ne 2 ]; then
  usage
fi

DIRECTORY=$1
EXTENSION=$2

if [ ! -d "$DIRECTORY" ]; then
  echo "Директорія не існує: $DIRECTORY"
  exit 1
fi

COUNT=$(find "$DIRECTORY" -maxdepth 1 -type f -name "*.$EXTENSION" | wc -l)

echo "Кількість файлів з розширенням '$EXTENSION' у директорії '$DIRECTORY': $COUNT"
