#!/bin/sh

YOUTUBE_FOLDER=/mnt/18tb/Media/Youtube
DOWNLOAD_ARCHIVE_FILE=$YOUTUBE_FOLDER/downloaded.txt
CHANNEL_LIST_FILE=$YOUTUBE_FOLDER/channel_list.txt

#youtube-dl --playlist-reverse 
cd /mnt/18tb/Media/Youtube 

  #--playlist-reverse \
/usr/local/bin/yt-dlp \
  --write-info-json \
  --write-thumbnail \
  --write-playlist-metafiles \
  --add-metadata \
  --no-overwrites \
  --ignore-errors \
  --embed-metadata \
  --download-archive $DOWNLOAD_ARCHIVE_FILE \
  -f bestvideo+bestaudio --merge-output-format mkv \
  -i \
  -o "%(uploader)s/%(playlist)s/%(playlist)s - S01E%(n_entries+1-playlist_index)s - %(title)s [%(id)s].%(ext)s" \
  --batch-file $CHANNEL_LIST_FILE \
  | grep --line-buffered --invert-match "has already been recorded in the archive"

docker exec -it plex /usr/lib/plexmediaserver/Plex\ Media\ Scanner --scan -c 8

