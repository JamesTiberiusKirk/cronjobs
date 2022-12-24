#!/bin/sh

ROOT_DL_PATH=/mnt/18tb/downloads/complete
ROOT_MEDIA_PATH=/mnt/18tb/Media

folder_check(){
  FOLDER=$1
  TO_FOLDER=$2
  PLEX_SCAN_CODE=$3

  if [ -n "$(ls -A $FOLDER )" ]
  then
    echo "New downloads in "$FOLDER
    echo "Moving "$(ls -A $FOLDER)
    mv $FOLDER/* $TO_FOLDER/
    docker exec -it plex /usr/lib/plexmediaserver/Plex\ Media\ Scanner --scan -c $PLEX_SCAN_CODE
  fi
}

folder_check "$ROOT_DL_PATH/tvshows" "$ROOT_MEDIA_PATH/tv_shows" 2
folder_check "$ROOT_DL_PATH/music" "$ROOT_MEDIA_PATH/Music/unsorted" 1
folder_check "$ROOT_DL_PATH/movies" "$ROOT_MEDIA_PATH/Movies" 3
folder_check "$ROOT_DL_PATH/cartoons" "$ROOT_MEDIA_PATH/Cartoons" 6
folder_check "$ROOT_DL_PATH/anime" "$ROOT_MEDIA_PATH/Anime_Shows" 4
folder_check "$ROOT_DL_PATH/animemovies" "$ROOT_MEDIA_PATH/Anime" 5
