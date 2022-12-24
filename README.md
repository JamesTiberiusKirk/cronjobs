# Server cron jobs
- Add the user's crons
```sh
* 5 * * * /home/darthvader/crons/yt-dl.sh >> /home/darthvader/crons/yt-dl.sh.log 2>&1
0 * * * * /home/darthvader/crons/downloads_scanner.sh >> /mnt/18tb/Media/Youtube/downloads_scanner.sh.log 2>&1
```
