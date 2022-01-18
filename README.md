# openwith

A small utility to specify which application (via bundle id) should open specific file
extensions. It was made as a simplified version of
[duti](https://github.com/moretension/duti) which does not work on macOS Big
Sur (or later). openwith requires macOS 11.0 (or greater).

## Usage

```
usage: openwith <bundle> [extension ...]
```

## Example

```sh
$ osascript -e 'id of app "mpv"'
io.mpv
$ openwith io.mpv mkv mov mp4 avi
mkv (org.matroska.mkv) -> io.mpv
mkv (io.mpv.mkv) -> io.mpv
mov (com.apple.quicktime-movie) -> io.mpv
mp4 (public.mpeg-4) -> io.mpv
mp4 (public.mpeg-4-audio) -> io.mpv
avi (public.avi) -> io.mpv
avi (io.mpv.avi) -> io.mpv
```
