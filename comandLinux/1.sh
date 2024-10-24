
if [ "$#" -ne 2 ]; then
  echo "Використання: $0 <шлях> <розширення>"
  exit 1
fi

DIRECTORY=$1
EXTENSION=$2


if [ ! -d "$DIRECTORY" ]; then
  echo "Директорія не існує: $DIRECTORY"
  exit 1
fi

echo "Файли з розширенням '$EXTENSION' в директорії '$DIRECTORY':"
find "$DIRECTORY" -type f -name "*.$EXTENSION"
