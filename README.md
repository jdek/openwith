# openwith

A small utility to specify which application bundle should open specific file
extensions. It was made as a simplified version of
[duti](https://github.com/moretension/duti) which does not work on macOS Big
Sur. openwith requires macOS 11.0 (or greater).

## Usage

```
usage: openwith <bundle> [extension ...]
```

## Example

```sh
$ openwith io.mpv mkv mov mp4 avi
```
