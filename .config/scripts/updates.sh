updates="$(checkupdates | wc -l)"
printf '{"text":%s,"alt":%s,"tooltip":%s,"class":"green"}\n' "$updates" "$updates" "$updates"


