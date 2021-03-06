![Logo](https://github.com/posidron/posidron.github.io/raw/master/static/images/fuzzos.png)

[![](https://images.microbadger.com/badges/image/mozillasecurity/fuzzos-windows.svg)](https://microbadger.com/images/mozillasecurity/fuzzos-windows "Get your own image badge on microbadger.com")

## OS

OS: Windows 10 Version 1809

### Pre-Installed Packages

- credstash
- fuzzfetch
- fuzzmanager
- llvm
- grcov
- ripgrep
- nodejs
- micro
- python3
- git
- busybox

## Run

For detailed instructions see the [https://github.com/MozillaSecurity/orion/wiki/Docker-on-Windows](Wiki) entry.

```bash
docker build --isolation=process -t mozillasecurity/fuzzos-windows:latest
docker run --rm --isolation=process -it mozillasecurity/fuzzos-windows:latest
```

