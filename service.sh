#!/system/bin/sh

# Do NOT assume where your module will be located. ALWAYS use $MODDIR if you
# need to know where this script and module is placed. This will make sure your
# module will work if Magisk changes it's mount point in the future.
MODDIR="${0%/*}"

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness
BRIGHTNESS_SCRIPT="$MODDIR/min-brightness.sh"

until [ "$(getprop sys.boot_completed)" = 1 ] && \
      [ "$(getprop dev.bootcomplete)" = 1 ] && \
      [ "$(getprop service.bootanim.exit)" = 1 ] && \
      [ "$(getprop init.svc.bootanim)" = stopped ]; do
  sleep 5
done

# Monitor writes to $BRIGHTNESS_FILE and call $BRIGHTNESS_SCRIPT.
inotifyd "$BRIGHTNESS_SCRIPT" "$BRIGHTNESS_FILE:/w"

exit 0
