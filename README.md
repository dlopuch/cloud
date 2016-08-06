# *cats LED Cloud Code

The cloud is run by a processing sketch driving fadecandies over USB.

## Requirements
To run the cloud,

- Download [Processing 3](https://processing.org/) -- Processing 2 WILL NOT WORK with this code.
- 'Minim' sound processing lib.
  - Open up Processing
  - Sketch > Import Library > Add Library
  - Search for "Minim".  Install "Minim -- an audio library that provides easy..."

## To run code
- Power up cloud
- Run the appropriate fadecandy server from `fadecandy_bin`
  - eg if OSX, `$ ./fadecandy_bin/fcserver-osx`
  - You shouldn't trust executables from random github repos.  Bonus points if you were paranoid and actually got the bins from the official [fadecandy repo](https://github.com/scanlime/fadecandy)
- Plug into the cloud's USB hub
  - You should see some console messages like 
```
[1470464845:9305] NOTICE: Server listening on 127.0.0.1:7890
USB device Fadecandy (Serial# D3ADB33FMMMMMMMM, Version 1.07) attached.
USB device Fadecandy (Serial# QWERTYUIOPASDFGH, Version 1.07) attached.
[1470464845:9480] NOTICE: New Open Pixel Control connection
```
- Open up `icosastar_processing3/icosastar_processing3.pde` in Processing 3
  - Code quality sucks.  I butchered a different project to hack this together.  Appologies for stuff that makes no sense.
- Click Play
  - You should see 16 dotted lines radiating outwards from the center and colors that react to music.  Also, lots of light coming from the direction of the cloud.

## Debugging
Something not working? Try a few things.

- If processing sketch is moving but cloud isn't, restart the fadecandy server -- on OS-X `Ctrl + C` then restart it
- If you don't see the `USB device Fadecandy (...) attached` line, make sure the USB hub is powered on (needs to be a powered USB hub).
- If you don't see the dotted lines on the processing sketch, the `fcserver` isn't running in the background.  Sometimes it crashes when removing USB devices, try restarting it.

 
