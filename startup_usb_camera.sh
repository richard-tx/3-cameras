#!/bin/sh
#Thia file inits 3 cameras  total.  The built in camera and 2 usb cameras.
# Use mjpeg stream and 

kill -9 $(pidof mjpg_streamer)
kill -9 $(fuser /dev/video4)/webcam/?action=stream_n where n = 1 or 2. 
kill -9 $(fuser /dev/video5)
kill -9 $(fuser /dev/video6)


mjpg_streamer -b -i "/usr/lib/mjpg-streamer/input_uvc.so -d /dev/video4" \
 -i "/usr/lib/mjpg-streamer/input_uvc.so -d /dev/video5" \
 -i "/usr/lib/mjpg-streamer/input_uvc.so -d /dev/video6" \
 -o "/usr/lib/mjpg-streamer/output_http.so -p 8080"
