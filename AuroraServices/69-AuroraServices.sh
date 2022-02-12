#!/sbin/sh

. /tmp/backuptool.functions

DIR_NAME=AuroraServices
FILE_NAME=AuroraServices.apk
PERMISSION_FILE_NAME=com.aurora.services.xml

list_files() {
cat <<EOF
app/${FILE_NAME}
app/${DIR_NAME}/${FILE_NAME}
priv-app/${FILE_NAME}
priv-app/${DIR_NAME}/${FILE_NAME}
etc/permissions/${PERMISSION_FILE_NAME}
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
