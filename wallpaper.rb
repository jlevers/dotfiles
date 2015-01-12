#!/bin/ruby

while true do
  # Generates a random number between 2 and 140000
  number = Random.rand(2..140000)

  `feh --bg-scale "http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-#{number}.jpg"`

  sleep(600)
end
