#! /bin/bash
#
# 24/7 Radio Push 
# Made by Nacho Mileo / LSD Live

CBR="128k" # Bitrate
RTMP_URL="rtmp://..."  # URL
AUTH="rtmpauth=USER:PASS" # Use your own configuration for rtmpauth
STREAM="STREAMNAME" # Stream
SOURCE="tracklist.txt" # Source 

ffmpeg  -re -stream_loop -1 \
		-f concat -i "$SOURCE" \
		-acodec libmp3lame -ab "128k" -ac 2 -ar 44100 \
		-f flv "$RTMP_URL?$AUTH/$STREAM"