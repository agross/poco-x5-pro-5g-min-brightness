#!/system/bin/sh

# This script checks the current brightness ensures a minimum brightness of 15.
# This prevents the green screen tint if the brightness is low.

BRIGHTNESS_FILE=/sys/class/backlight/panel0-backlight/brightness
BRIGHTNESS="$(cat "$BRIGHTNESS_FILE")"

if [ "$BRIGHTNESS" -lt 15 ]; then
  echo 15 > "$BRIGHTNESS_FILE"
fi

exit 0
