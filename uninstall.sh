[[ -e "/data/system/package_cache" ]] && rm -rf "/data/system/package_cache"

# Don't modify anything after this
[[ -f "$INFO" ]] && {
  while read LINE; do
    if [[ "$(echo -n "$LINE" | tail -c 1)" == "~" ]]; then
      continue
    elif [[ -f "$LINE~" ]]; then
      mv -f "$LINE~" "$LINE"
    else
      rm -rf "$LINE"
      while true; do
        LINE="$(dirname "$LINE")"
        [[ "$(ls -A $LINE 2>/dev/null)" ]] && break 1 || rm -rf "$LINE"
      done
    fi
  done < "$INFO"
  rm -rf "$INFO"
}
pm enable-user --user 0 com.android.providers.contacts
pm enable-user --user 0 com.android.nfc
pm enable-user --user 0 com.android.smspush
pm enable-user --user 0 me.phh.treble.overlay.cafims_telephony
pm enable-user --user 0 me.phh.treble.overlay.hwims_telephony
pm enable-user --user 0 me.phh.treble.overlay.mtkims_telephony
pm enable-user --user 0 me.phh.treble.overlay.slsiims_telephony
pm enable-user --user 0 me.phh.treble.overlay.sprdims_telephony
pm enable-user --user 0 me.phh.treble.overlay.telephony.lte
pm enable-user --user 0 me.phh.treble.overlay.tethering
pm enable-user --user 0 com.android.mms.service
pm enable-user --user 0 com.android.stk
pm enable-user --user 0 com.android.simappdialog
pm enable-user --user 0 com.android.providers.blockednumber
pm enable-user --user 0 com.android.messaging
pm enable-user --user 0 com.android.cellbroadcastreceiver.module
pm enable-user --user 0 com.android.carrierdefaultapp
pm enable-user --user 0 com.android.server.telecom
pm enable-user --user 0 com.android.dialer
pm enable-user --user 0 com.android.phone
pm enable-user --user 0 com.android.contacts
pm enable-user --user 0 im.angry.openeuicc
pm enable-user --user 0 com.google.android.dialer
pm enable-user --user 0 com.google.android.contacts
