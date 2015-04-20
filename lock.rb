while true
  if `head -n 1 /proc/asound/card0/pcm0p/sub0/status` != "closed\n"
    no_action = false
  elsif `head -n 1 /proc/asound/card1/pcm0p/sub0/status` != "closed\n"
    no_action = false
  elsif 
