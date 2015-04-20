#!/bin/ruby

state = `xset q | grep timeout`

if (state == "  timeout:  0    cycle:  600\n")
  # Turns on screen timeout
  `xset s blank; xset s 600`
else
  # Turns off screen timeout
  `xset s off`
end